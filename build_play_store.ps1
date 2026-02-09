# ============================================================
# 🚀 GUÍA COMPLETA: Publicar Uniko en Google Play Store
# ============================================================
# Versión: 10.52
# Fecha: Enero 2026
# ============================================================

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# PASO 1: VERIFICAR CONFIGURACIÓN DE FIRMA
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Write-Host "🔑 Verificando configuración de Keystore..." -ForegroundColor Cyan

$keystorePath = "android\keystores\robert-darin-key.jks"
$keyPropertiesPath = "android\key.properties"

if (Test-Path $keystorePath) {
    Write-Host "✅ Keystore encontrado: $keystorePath" -ForegroundColor Green
} else {
    Write-Host "❌ ERROR: Keystore no encontrado" -ForegroundColor Red
    Write-Host "Ejecuta: keytool -genkey -v -keystore android\keystores\robert-darin-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias robertdarin" -ForegroundColor Yellow
    exit 1
}

if (Test-Path $keyPropertiesPath) {
    Write-Host "✅ key.properties encontrado" -ForegroundColor Green
} else {
    Write-Host "❌ ERROR: key.properties no encontrado" -ForegroundColor Red
    exit 1
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# PASO 2: LIMPIAR Y PREPARAR
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Write-Host ""
Write-Host "🧹 Limpiando proyecto..." -ForegroundColor Cyan
flutter clean
flutter pub get

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# PASO 3: VERIFICAR VERSIÓN
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Write-Host ""
Write-Host "📋 Verificando versión en pubspec.yaml..." -ForegroundColor Cyan
$pubspec = Get-Content "pubspec.yaml" | Select-String "version:"
Write-Host "   Versión actual: $pubspec" -ForegroundColor Yellow

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# PASO 4: CONSTRUIR APP BUNDLE (.aab) PARA PLAY STORE
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Write-Host ""
Write-Host "📦 Construyendo App Bundle para Google Play..." -ForegroundColor Cyan
Write-Host "   (Esto puede tomar varios minutos)" -ForegroundColor Gray

flutter build appbundle --release

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ ¡BUILD EXITOSO!" -ForegroundColor Green
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host "📍 ARCHIVO PARA SUBIR A GOOGLE PLAY:" -ForegroundColor White
    Write-Host ""
    Write-Host "   build\app\outputs\bundle\release\app-release.aab" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    
    # Mostrar tamaño del archivo
    $aabPath = "build\app\outputs\bundle\release\app-release.aab"
    if (Test-Path $aabPath) {
        $fileSize = (Get-Item $aabPath).Length / 1MB
        Write-Host "   Tamaño: $([math]::Round($fileSize, 2)) MB" -ForegroundColor Gray
    }
    
    # Abrir carpeta
    Write-Host ""
    $openFolder = Read-Host "¿Abrir carpeta del archivo? (s/n)"
    if ($openFolder -eq "s") {
        explorer "build\app\outputs\bundle\release"
    }
} else {
    Write-Host "❌ Error en el build. Revisa los errores arriba." -ForegroundColor Red
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "📝 PRÓXIMOS PASOS EN GOOGLE PLAY CONSOLE:" -ForegroundColor White
Write-Host ""
Write-Host "1. Ir a: https://play.google.com/console" -ForegroundColor Gray
Write-Host "2. Crear nueva aplicación o seleccionar existente" -ForegroundColor Gray
Write-Host "3. Ir a 'Producción' > 'Crear nueva versión'" -ForegroundColor Gray
Write-Host "4. Subir el archivo .aab" -ForegroundColor Gray
Write-Host "5. Completar la información de la versión" -ForegroundColor Gray
Write-Host "6. Enviar a revisión" -ForegroundColor Gray
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
