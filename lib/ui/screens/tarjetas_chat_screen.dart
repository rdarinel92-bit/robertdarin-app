// ═══════════════════════════════════════════════════════════════════════════════
// PANTALLA: Chat de Tarjetas Digitales
// Permite ver y responder mensajes de visitantes que contactan via tarjetas QR
// ═══════════════════════════════════════════════════════════════════════════════

import 'dart:async';
import 'package:flutter/material.dart';
import '../components/premium_scaffold.dart';
import '../navigation/app_routes.dart';
import '../../core/supabase_client.dart';

class TarjetasChatScreen extends StatefulWidget {
  const TarjetasChatScreen({super.key});

  @override
  State<TarjetasChatScreen> createState() => _TarjetasChatScreenState();
}

class _TarjetasChatScreenState extends State<TarjetasChatScreen> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _conversaciones = [];
  String? _selectedVisitanteId;
  List<Map<String, dynamic>> _mensajes = [];
  final TextEditingController _mensajeController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _refreshTimer;
  
  // Negocios del usuario actual
  List<String> _misNegociosIds = [];
  bool _esSuperAdmin = false;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _inicializarYCargar();
  }
  
  Future<void> _inicializarYCargar() async {
    await _cargarMisNegocios();
    await _cargarConversaciones();
    // Actualizar cada 10 segundos
    _refreshTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (_selectedVisitanteId != null) {
        _cargarMensajes(_selectedVisitanteId!);
      } else {
        _cargarConversaciones();
      }
    });
  }
  
  Future<void> _cargarMisNegocios() async {
    try {
      final user = AppSupabase.client.auth.currentUser;
      if (user == null) return;
      
      // Verificar si es superadmin - usando la tabla correcta usuarios_roles
      final rolesAsignados = await AppSupabase.client
          .from('usuarios_roles')
          .select('rol_id, roles!inner(nombre)')
          .eq('usuario_id', user.id);
      
      for (final ur in rolesAsignados) {
        final rolNombre = ur['roles']?['nombre']?.toString().toLowerCase() ?? '';
        if (rolNombre == 'superadmin' || rolNombre == 'admin') {
          _esSuperAdmin = true;
          break;
        }
      }
      
      // También verificar por email de owner
      final ownerEmails = ['rdarinel992@gmail.com', 'rdarinel92@gmail.com'];
      if (ownerEmails.contains(user.email?.toLowerCase())) {
        _esSuperAdmin = true;
      }
      
      if (_esSuperAdmin) {
        // Superadmin ve todos los negocios
        final negocios = await AppSupabase.client
            .from('negocios')
            .select('id')
            .eq('activo', true);
        _misNegociosIds = negocios.map((n) => n['id'] as String).toList();
      } else {
        // Empleado: buscar sus negocios asignados
        final asignaciones = await AppSupabase.client
            .from('empleados_negocios')
            .select('negocio_id')
            .eq('auth_uid', user.id)
            .eq('activo', true);
        
        _misNegociosIds = asignaciones.map((a) => a['negocio_id'] as String).toList();
        
        // Si no tiene asignaciones directas, buscar por empleado
        if (_misNegociosIds.isEmpty) {
          final empleado = await AppSupabase.client
              .from('empleados')
              .select('id, sucursal_id, sucursales!inner(negocio_id)')
              .eq('usuario_id', user.id)
              .eq('activo', true)
              .maybeSingle();
          
          if (empleado != null && empleado['sucursales'] != null) {
            final negocioId = empleado['sucursales']['negocio_id'];
            if (negocioId != null) {
              _misNegociosIds.add(negocioId as String);
            }
          }
        }
      }
      
      debugPrint('Negocios del usuario: $_misNegociosIds (superadmin: $_esSuperAdmin)');
    } catch (e) {
      debugPrint('Error cargando mis negocios: $e');
    }
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _mensajeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _cargarConversaciones() async {
    try {
      // Si no tiene negocios asignados, mostrar mensaje
      if (_misNegociosIds.isEmpty && !_esSuperAdmin) {
        if (mounted) {
          setState(() {
            _conversaciones = [];
            _isLoading = false;
            _errorMsg = 'No tienes negocios asignados. Contacta al administrador.';
          });
        }
        return;
      }
      
      // Obtener conversaciones filtradas por negocios del usuario
      List<dynamic> res;
      if (_misNegociosIds.isNotEmpty) {
        res = await AppSupabase.client
            .from('tarjetas_chat')
            .select('*')
            .eq('es_respuesta', false)
            .inFilter('negocio_id', _misNegociosIds)
            .order('created_at', ascending: false);
      } else {
        // Superadmin sin negocios específicos - ver todos
        res = await AppSupabase.client
            .from('tarjetas_chat')
            .select('*')
            .eq('es_respuesta', false)
            .order('created_at', ascending: false);
      }

      // Si hay mensajes, obtener info de las tarjetas
      Map<String, Map<String, dynamic>> tarjetasInfo = {};
      if (res.isNotEmpty) {
        final tarjetaIds = res.map((m) => m['tarjeta_id']).toSet().toList();
        for (final tid in tarjetaIds) {
          if (tid != null) {
            try {
              final tarjeta = await AppSupabase.client
                  .from('tarjetas_servicio')
                  .select('id, nombre_negocio, modulo')
                  .eq('id', tid)
                  .maybeSingle();
              if (tarjeta != null) {
                tarjetasInfo[tid] = tarjeta;
              }
            } catch (_) {}
          }
        }
      }

      // Agrupar por visitante_id
      final Map<String, Map<String, dynamic>> grouped = {};
      for (final msg in res) {
        final vid = msg['visitante_id'] as String? ?? 'unknown';
        if (!grouped.containsKey(vid)) {
          final tid = msg['tarjeta_id'];
          final tarjeta = tid != null ? tarjetasInfo[tid] : null;
          grouped[vid] = {
            'visitante_id': vid,
            'visitante_nombre': msg['visitante_nombre'] ?? 'Visitante',
            'tarjeta_id': tid,
            'negocio_id': msg['negocio_id'],
            'ultimo_mensaje': msg['mensaje'],
            'ultima_fecha': msg['created_at'],
            'nombre_negocio': tarjeta?['nombre_negocio'] ?? 'Sin nombre',
            'modulo': tarjeta?['modulo'] ?? 'general',
            'no_leidos': 0,
          };
        }
        if (msg['leido'] == false) {
          grouped[vid]!['no_leidos'] = (grouped[vid]!['no_leidos'] as int) + 1;
        }
      }

      if (mounted) {
        setState(() {
          _conversaciones = grouped.values.toList();
          _isLoading = false;
          _errorMsg = null;
        });
      }
    } catch (e) {
      debugPrint('Error cargando conversaciones: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMsg = 'Error al cargar conversaciones: $e';
        });
      }
    }
  }

  Future<void> _cargarMensajes(String visitanteId) async {
    try {
      final res = await AppSupabase.client
          .from('tarjetas_chat')
          .select()
          .eq('visitante_id', visitanteId)
          .order('created_at', ascending: true);

      if (mounted) {
        setState(() {
          _mensajes = List<Map<String, dynamic>>.from(res);
        });
        _scrollToBottom();
      }

      // Marcar como leídos
      await AppSupabase.client
          .from('tarjetas_chat')
          .update({'leido': true})
          .eq('visitante_id', visitanteId)
          .eq('es_respuesta', false);
    } catch (e) {
      debugPrint('Error cargando mensajes: $e');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _enviarRespuesta() async {
    if (_mensajeController.text.trim().isEmpty || _selectedVisitanteId == null) {
      return;
    }

    final mensaje = _mensajeController.text.trim();
    _mensajeController.clear();

    // Obtener datos de la conversación actual
    final conv = _conversaciones.firstWhere(
      (c) => c['visitante_id'] == _selectedVisitanteId,
      orElse: () => {},
    );

    try {
      await AppSupabase.client.from('tarjetas_chat').insert({
        'tarjeta_id': conv['tarjeta_id'],
        'negocio_id': conv['negocio_id'],
        'visitante_id': _selectedVisitanteId,
        'mensaje': mensaje,
        'es_respuesta': true,
        'leido': false,
      });

      // Recargar mensajes
      _cargarMensajes(_selectedVisitanteId!);
    } catch (e) {
      debugPrint('Error enviando respuesta: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al enviar mensaje'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _seleccionarConversacion(String visitanteId) {
    setState(() {
      _selectedVisitanteId = visitanteId;
      _mensajes = [];
    });
    _cargarMensajes(visitanteId);
  }

  @override
  Widget build(BuildContext context) {
    return PremiumScaffold(
      title: 'Chat Tarjetas',
      actions: [
        // V10.56 - Botón para configurar permisos de notificaciones
        IconButton(
          icon: const Icon(Icons.admin_panel_settings),
          tooltip: 'Permisos de notificación',
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.permisosChatQR);
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            if (_selectedVisitanteId != null) {
              _cargarMensajes(_selectedVisitanteId!);
            } else {
              _cargarConversaciones();
            }
          },
        ),
      ],
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37)))
          : _errorMsg != null
              ? _buildErrorState()
              : _selectedVisitanteId != null
                  ? _buildChatView()
                  : _buildListaConversaciones(),
    );
  }
  
  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.orange),
            const SizedBox(height: 16),
            Text(
              _errorMsg ?? 'Error desconocido',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _inicializarYCargar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListaConversaciones() {
    if (_conversaciones.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 80, color: Colors.grey[600]),
            const SizedBox(height: 16),
            Text(
              'Sin mensajes de visitantes',
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Cuando alguien escriba desde tu tarjeta\naparecerá aquí',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _cargarConversaciones,
      color: const Color(0xFFD4AF37),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _conversaciones.length,
        itemBuilder: (context, index) {
          final conv = _conversaciones[index];
          final noLeidos = conv['no_leidos'] as int;
          final fecha = DateTime.tryParse(conv['ultima_fecha'] ?? '') ?? DateTime.now();
          final moduloIcons = {
            'climas': '❄️',
            'prestamos': '🏦',
            'tandas': '👥',
            'cobranza': '📋',
            'servicios': '🔧',
          };

          return Card(
            color: const Color(0xFF1A1A2E),
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: noLeidos > 0
                  ? const BorderSide(color: Color(0xFFD4AF37), width: 1)
                  : BorderSide.none,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _seleccionarConversacion(conv['visitante_id']),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF667eea).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          moduloIcons[conv['modulo']?.toLowerCase()] ?? '💬',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  conv['visitante_nombre'] ?? 'Visitante',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                _formatFecha(fecha),
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            conv['nombre_negocio'] ?? '',
                            style: TextStyle(
                              color: const Color(0xFFD4AF37).withOpacity(0.8),
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  conv['ultimo_mensaje'] ?? '',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (noLeidos > 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD4AF37),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '$noLeidos',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatView() {
    final conv = _conversaciones.firstWhere(
      (c) => c['visitante_id'] == _selectedVisitanteId,
      orElse: () => {'visitante_nombre': 'Visitante'},
    );

    return Column(
      children: [
        // Header de la conversación
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            border: Border(
              bottom: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _selectedVisitanteId = null;
                    _mensajes = [];
                  });
                  _cargarConversaciones();
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conv['visitante_nombre'] ?? 'Visitante',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      conv['nombre_negocio'] ?? '',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Mensajes
        Expanded(
          child: _mensajes.isEmpty
              ? Center(
                  child: Text(
                    'Cargando mensajes...',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _mensajes.length,
                  itemBuilder: (context, index) {
                    final msg = _mensajes[index];
                    final esRespuesta = msg['es_respuesta'] == true;
                    final fecha = DateTime.tryParse(msg['created_at'] ?? '') ?? DateTime.now();

                    return Align(
                      alignment: esRespuesta
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: esRespuesta
                              ? const Color(0xFFD4AF37)
                              : const Color(0xFF1A1A2E),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: Radius.circular(esRespuesta ? 16 : 4),
                            bottomRight: Radius.circular(esRespuesta ? 4 : 16),
                          ),
                          border: esRespuesta
                              ? null
                              : Border.all(color: Colors.white.withOpacity(0.1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              msg['mensaje'] ?? '',
                              style: TextStyle(
                                color: esRespuesta ? Colors.black : Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatHora(fecha),
                              style: TextStyle(
                                color: esRespuesta
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.grey[500],
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),

        // Input de mensaje
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            border: Border(
              top: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _mensajeController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Escribe tu respuesta...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: const Color(0xFF12121A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: (_) => _enviarRespuesta(),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD4AF37), Color(0xFFB8860B)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: IconButton(
                  onPressed: _enviarRespuesta,
                  icon: const Icon(Icons.send, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatFecha(DateTime fecha) {
    final now = DateTime.now();
    final diff = now.difference(fecha);

    if (diff.inDays == 0) {
      return '${fecha.hour.toString().padLeft(2, '0')}:${fecha.minute.toString().padLeft(2, '0')}';
    } else if (diff.inDays == 1) {
      return 'Ayer';
    } else if (diff.inDays < 7) {
      const dias = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
      return dias[fecha.weekday - 1];
    } else {
      return '${fecha.day}/${fecha.month}';
    }
  }

  String _formatHora(DateTime fecha) {
    return '${fecha.hour.toString().padLeft(2, '0')}:${fecha.minute.toString().padLeft(2, '0')}';
  }
}
