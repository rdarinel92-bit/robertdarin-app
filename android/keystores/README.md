# Carpeta de Keystores - NO SUBIR A GIT

Esta carpeta contiene los keystores para firmar la aplicación.

## ⚠️ IMPORTANTE

1. **NUNCA** subas el archivo `.jks` a Git
2. **GUARDA BACKUP** del keystore en lugar seguro
3. Si pierdes el keystore, no podrás actualizar la app en Play Store

## Archivos esperados:

- `robert-darin-key.jks` - Keystore de producción (NO incluido)

## Generar nuevo keystore:

```bash
keytool -genkey -v -keystore robert-darin-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias robertdarin
```
