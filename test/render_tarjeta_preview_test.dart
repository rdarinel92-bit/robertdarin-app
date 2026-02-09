import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:robertdarin/ui/screens/tarjetas_servicio_screen.dart';

void main() {
  testWidgets('render tarjeta preview to png', (tester) async {
    final key = GlobalKey();
    const dpi = 300.0;
    final widthPx = (kTarjetaPrintWidthCm / 2.54 * dpi);
    final heightPx = (kTarjetaPrintHeightCm / 2.54 * dpi);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFF0B1320),
          body: Center(
            child: RepaintBoundary(
              key: key,
              child: SizedBox(
                width: widthPx,
                height: heightPx,
                child: const TarjetaPreviewCard(
                  nombreTarjeta: 'ZAPATA',
                  nombreNegocio: 'ZAPATA',
                  slogan: 'Aire acondicionado',
                  telefono: '55 1234 5678',
                  whatsapp: '55 2222 3333',
                  email: 'contacto@zapata.mx',
                  direccion: 'Av. Principal 123',
                  ciudad: 'CDMX',
                  servicios: ['Instalacion', 'Reparacion'],
                  colorPrimario: '#00D9FF',
                  colorSecundario: '#8B5CF6',
                  modulo: 'climas',
                  template: 'profesional',
                  qrData: 'https://example.com/qr?modulo=climas&negocio=demo&tarjeta=DEMO1234',
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      fail('No se pudo renderizar la tarjeta');
    }

    final image = await boundary.toImage(pixelRatio: 1.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      fail('No se pudo convertir la imagen a PNG');
    }
    final bytes = byteData.buffer.asUint8List();

    final outputDir = Directory('build/render');
    if (!outputDir.existsSync()) {
      outputDir.createSync(recursive: true);
    }
    final file = File('build/render/tarjeta_preview.png');
    await file.writeAsBytes(bytes);
  });
}
