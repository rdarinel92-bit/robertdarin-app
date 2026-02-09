# ============================================================
# SCRIPT PARA CREAR BASE DE DATOS LIMPIA EN SUPABASE LOCAL
# ============================================================
# Prerrequisito: Docker Desktop debe estar corriendo
# 
# Uso: .\setup_supabase_fresh.ps1
# ============================================================

$ErrorActionPreference = "Continue"
Set-Location "c:\Users\rober\Desktop\robertdarin"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "   SETUP SUPABASE - BASE DE DATOS LIMPIA" -ForegroundColor Cyan
Write-Host "   Robert Darin Fintech v11" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Verificar Docker
Write-Host "[1/5] Verificando Docker Desktop..." -ForegroundColor Yellow
$dockerRunning = docker info 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Docker Desktop no esta corriendo!" -ForegroundColor Red
    Write-Host "Por favor inicia Docker Desktop y ejecuta este script de nuevo." -ForegroundColor Red
    Write-Host ""
    Write-Host "Tip: Abre Docker Desktop desde el menu de inicio" -ForegroundColor Yellow
    exit 1
}
Write-Host "   OK - Docker esta corriendo" -ForegroundColor Green
Write-Host ""

# 2. Detener Supabase existente
Write-Host "[2/5] Deteniendo Supabase existente (sin backup)..." -ForegroundColor Yellow
supabase stop --no-backup 2>$null
Write-Host "   OK - Supabase detenido" -ForegroundColor Green
Write-Host ""

# 3. Verificar que la migracion tiene contenido
Write-Host "[3/5] Verificando archivo de migracion..." -ForegroundColor Yellow
$migrationFile = ".\supabase\migrations\20260113201908_001_schema_completo_v11.sql"
$schemaFile = ".\database_schema.sql"

if (-not (Test-Path $migrationFile)) {
    Write-Host "   Creando archivo de migracion..." -ForegroundColor Yellow
    New-Item -ItemType File -Path $migrationFile -Force | Out-Null
}

$migrationContent = Get-Content $migrationFile -Raw -ErrorAction SilentlyContinue
$schemaContent = Get-Content $schemaFile -Raw

if ([string]::IsNullOrWhiteSpace($migrationContent) -or $migrationContent.Length -lt 1000) {
    Write-Host "   Copiando database_schema.sql a migracion..." -ForegroundColor Yellow
    Copy-Item $schemaFile $migrationFile -Force
    Write-Host "   OK - Esquema copiado ($((Get-Content $schemaFile).Count) lineas)" -ForegroundColor Green
} else {
    $lineCount = (Get-Content $migrationFile).Count
    Write-Host "   OK - Migracion ya tiene contenido ($lineCount lineas)" -ForegroundColor Green
}
Write-Host ""

# 4. Iniciar Supabase
Write-Host "[4/5] Iniciando Supabase (esto puede tardar 1-3 minutos)..." -ForegroundColor Yellow
Write-Host "   Aplicando migraciones automaticamente..." -ForegroundColor Gray
$startResult = supabase start 2>&1

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "ERROR durante inicio de Supabase:" -ForegroundColor Red
    Write-Host $startResult -ForegroundColor Red
    Write-Host ""
    Write-Host "Posibles soluciones:" -ForegroundColor Yellow
    Write-Host "   1. Verifica que Docker Desktop este corriendo" -ForegroundColor Yellow
    Write-Host "   2. Ejecuta: supabase db reset --debug" -ForegroundColor Yellow
    Write-Host "   3. Revisa errores SQL en la migracion" -ForegroundColor Yellow
    exit 1
}

Write-Host "   OK - Supabase iniciado correctamente" -ForegroundColor Green
Write-Host ""

# 5. Mostrar informacion de conexion
Write-Host "[5/5] Informacion de conexion:" -ForegroundColor Yellow
Write-Host ""
supabase status
Write-Host ""

Write-Host "============================================================" -ForegroundColor Green
Write-Host "   SUPABASE LISTO!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "URLs importantes:" -ForegroundColor Cyan
Write-Host "   Studio:     http://127.0.0.1:54323" -ForegroundColor White
Write-Host "   API:        http://127.0.0.1:54321" -ForegroundColor White
Write-Host "   Database:   postgresql://postgres:postgres@127.0.0.1:54322/postgres" -ForegroundColor White
Write-Host ""
Write-Host "Para conectar desde la app Flutter:" -ForegroundColor Cyan
Write-Host "   Usa las credenciales mostradas arriba en supabase_client.dart" -ForegroundColor White
Write-Host ""
Write-Host "Comandos utiles:" -ForegroundColor Cyan
Write-Host "   supabase status       - Ver estado actual" -ForegroundColor Gray
Write-Host "   supabase db reset     - Resetear base de datos" -ForegroundColor Gray
Write-Host "   supabase stop         - Detener Supabase" -ForegroundColor Gray
Write-Host ""
