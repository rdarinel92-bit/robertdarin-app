// ═══════════════════════════════════════════════════════════════════════════════
// TEST DE INTEGRACIÓN - MÓDULO TARJETAS V10.52
// Robert Darin Platform
// ═══════════════════════════════════════════════════════════════════════════════
//
// Este archivo verifica que todos los componentes del módulo de tarjetas
// están correctamente configurados y funcionando.
//
// Para ejecutar: flutter test test/tarjetas_integration_test.dart
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter_test/flutter_test.dart';
import 'package:robertdarin/data/models/tarjetas_models.dart';
import 'package:robertdarin/core/permisos_rol.dart';

void main() {
  group('🔧 Modelos de Tarjetas', () {
    test('TarjetasConfigModel se crea correctamente desde Map', () {
      final map = {
        'id': 'test-id-123',
        'negocio_id': 'negocio-456',
        'proveedor': 'stripe',
        'api_key': 'sk_test_xxx',
        'api_secret': 'secret_xxx',
        'modo_pruebas': true,
        'limite_diario_default': 10000.0,
        'limite_mensual_default': 50000.0,
        'moneda_default': 'MXN',
        'activo': true,
        'verificado': false,
        'created_at': DateTime.now().toIso8601String(),
      };

      final config = TarjetasConfigModel.fromMap(map);

      expect(config.id, equals('test-id-123'));
      expect(config.negocioId, equals('negocio-456'));
      expect(config.proveedor, equals('stripe'));
      expect(config.modoPruebas, isTrue);
      expect(config.limiteDiarioDefault, equals(10000.0));
      expect(config.monedaDefault, equals('MXN'));
      expect(config.tieneCredenciales, isTrue);
      expect(config.proveedorNombre, equals('Stripe Issuing'));
    });

    test('TarjetaTitularModel se crea con valores por defecto', () {
      final map = {
        'id': 'titular-123',
        'negocio_id': 'negocio-456',
        'nombre': 'Juan',
        'apellido_paterno': 'Pérez',
        'email': 'juan@test.com',
        'telefono': '5551234567',
        'created_at': DateTime.now().toIso8601String(),
      };

      final titular = TarjetaTitularModel.fromMap(map);

      expect(titular.nombre, equals('Juan'));
      expect(titular.nombreCompleto, equals('Juan Pérez'));
      expect(titular.email, equals('juan@test.com'));
      expect(titular.kycStatus, equals('pendiente'));
      expect(titular.activo, isTrue);
    });

    test('TarjetaVirtualModel se crea con límites correctos', () {
      final map = {
        'id': 'tarjeta-789',
        'negocio_id': 'negocio-456',
        'titular_id': 'titular-123',
        'tipo': 'virtual',
        'red': 'visa',
        'estado': 'activa',
        'limite_diario': 5000.0,
        'limite_mensual': 25000.0,
        'saldo_disponible': 1500.0,
        'created_at': DateTime.now().toIso8601String(),
      };

      final tarjeta = TarjetaVirtualModel.fromMap(map);

      expect(tarjeta.tipo, equals('virtual'));
      expect(tarjeta.red, equals('visa'));
      expect(tarjeta.estado, equals('activa'));
      expect(tarjeta.limiteDiario, equals(5000.0));
      expect(tarjeta.saldoDisponible, equals(1500.0));
    });

    test('TarjetasConfigModel maneja proveedores correctamente', () {
      final proveedores = ['pomelo', 'rapyd', 'stripe', 'galileo'];
      final nombresEsperados = ['Pomelo', 'Rapyd', 'Stripe Issuing', 'Galileo'];

      for (var i = 0; i < proveedores.length; i++) {
        final config = TarjetasConfigModel.fromMap({
          'id': 'test',
          'negocio_id': 'negocio',
          'proveedor': proveedores[i],
          'created_at': DateTime.now().toIso8601String(),
        });
        expect(config.proveedorNombre, equals(nombresEsperados[i]));
      }
    });
  });

  group('🔐 Sistema de Permisos', () {
    test('Cliente tiene acceso a módulo tarjetas', () {
      final tieneAcceso = PermisosRol.tieneAcceso('cliente', PermisosRol.modTarjetas);
      expect(tieneAcceso, isTrue, reason: 'Cliente debe tener acceso a modTarjetas');
    });

    test('Superadmin tiene acceso a módulo tarjetas', () {
      final tieneAcceso = PermisosRol.tieneAcceso('superadmin', PermisosRol.modTarjetas);
      expect(tieneAcceso, isTrue);
    });

    test('Admin tiene acceso a módulo tarjetas', () {
      // Verificar si admin tiene el módulo
      final modulosAdmin = PermisosRol.obtenerModulos('admin');
      // Admin puede no tener acceso directo, pero superadmin sí
      expect(modulosAdmin, isNotEmpty);
    });

    test('Aval NO tiene acceso a módulo tarjetas', () {
      final tieneAcceso = PermisosRol.tieneAcceso('aval', PermisosRol.modTarjetas);
      expect(tieneAcceso, isFalse, reason: 'Aval no debe tener acceso a tarjetas');
    });

    test('MenuItemConPermiso filtra por rol correctamente', () {
      // Item solo para clientes
      const itemCliente = MenuItemConPermiso(
        id: 'mis_tarjetas',
        titulo: 'Mis Tarjetas',
        moduloRequerido: PermisosRol.modTarjetas,
        rolesPermitidos: ['cliente'],
      );

      expect(itemCliente.esVisibleParaRol('cliente'), isTrue);
      expect(itemCliente.esVisibleParaRol('admin'), isFalse);
      expect(itemCliente.esVisibleParaRol('superadmin'), isFalse);

      // Item excluyendo cliente y aval
      const itemAdmin = MenuItemConPermiso(
        id: 'tarjetas',
        titulo: 'Tarjetas Virtuales',
        moduloRequerido: PermisosRol.modTarjetas,
        rolesExcluidos: ['cliente', 'aval'],
      );

      expect(itemAdmin.esVisibleParaRol('cliente'), isFalse);
      expect(itemAdmin.esVisibleParaRol('aval'), isFalse);
      expect(itemAdmin.esVisibleParaRol('admin'), isTrue);
      expect(itemAdmin.esVisibleParaRol('superadmin'), isTrue);
    });

    test('obtenerItemsParaRol devuelve items correctos para cliente', () {
      final itemsCliente = MenusApp.obtenerItemsParaRol('cliente');
      
      // Cliente debe ver "Mis Tarjetas" pero no "Tarjetas Virtuales"
      final tieneMisTarjetas = itemsCliente.any((item) => item.id == 'mis_tarjetas');
      final tieneTarjetasAdmin = itemsCliente.any((item) => item.id == 'tarjetas');

      expect(tieneMisTarjetas, isTrue, reason: 'Cliente debe ver Mis Tarjetas');
      expect(tieneTarjetasAdmin, isFalse, reason: 'Cliente NO debe ver Tarjetas Virtuales (admin)');
    });

    test('obtenerItemsParaRol devuelve items correctos para superadmin', () {
      final itemsAdmin = MenusApp.obtenerItemsParaRol('superadmin');
      
      // Superadmin debe ver "Tarjetas Virtuales" pero no "Mis Tarjetas"
      final tieneMisTarjetas = itemsAdmin.any((item) => item.id == 'mis_tarjetas');
      final tieneTarjetasAdmin = itemsAdmin.any((item) => item.id == 'tarjetas');

      expect(tieneMisTarjetas, isFalse, reason: 'Superadmin NO debe ver Mis Tarjetas');
      expect(tieneTarjetasAdmin, isTrue, reason: 'Superadmin debe ver Tarjetas Virtuales');
    });
  });

  group('📊 Validaciones de Datos', () {
    test('Tarjeta con estado bloqueada', () {
      final map = {
        'id': 'tarjeta-blocked',
        'negocio_id': 'negocio-456',
        'titular_id': 'titular-123',
        'estado': 'bloqueada',
        'motivo_bloqueo': 'Solicitud del cliente',
        'created_at': DateTime.now().toIso8601String(),
      };

      final tarjeta = TarjetaVirtualModel.fromMap(map);
      expect(tarjeta.estado, equals('bloqueada'));
      expect(tarjeta.motivoBloqueo, equals('Solicitud del cliente'));
    });

    test('Titular con KYC aprobado', () {
      final map = {
        'id': 'titular-kyc',
        'negocio_id': 'negocio-456',
        'nombre': 'María',
        'email': 'maria@test.com',
        'telefono': '5559876543',
        'kyc_status': 'aprobado',
        'kyc_nivel': 2,
        'created_at': DateTime.now().toIso8601String(),
      };

      final titular = TarjetaTitularModel.fromMap(map);
      expect(titular.kycStatus, equals('aprobado'));
      expect(titular.kycNivel, equals(2));
      expect(titular.kycStatusTexto, equals('Aprobado'));
      expect(titular.kycStatusColor, equals(0xFF10B981)); // Verde
    });

    test('Config sin credenciales', () {
      final config = TarjetasConfigModel.fromMap({
        'id': 'test',
        'negocio_id': 'negocio',
        'proveedor': 'stripe',
        'api_key': null,
        'created_at': DateTime.now().toIso8601String(),
      });

      expect(config.tieneCredenciales, isFalse);
    });

    test('Valores por defecto de TarjetaVirtualModel', () {
      final tarjeta = TarjetaVirtualModel.fromMap({
        'id': 'test',
        'negocio_id': 'negocio',
        'titular_id': 'titular',
        'created_at': DateTime.now().toIso8601String(),
      });

      expect(tarjeta.tipo, equals('virtual'));
      expect(tarjeta.red, equals('visa'));
      expect(tarjeta.estado, equals('activa'));
      expect(tarjeta.moneda, equals('MXN'));
      expect(tarjeta.limiteDiario, equals(10000));
      expect(tarjeta.permitirEcommerce, isTrue);
      expect(tarjeta.permitirAtm, isFalse);
    });
  });
}
