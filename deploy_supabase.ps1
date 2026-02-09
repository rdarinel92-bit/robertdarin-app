# ═══════════════════════════════════════════════════════════════════════════════
# SCRIPT DE DESPLIEGUE - ROBERT DARIN FINTECH
# Sincroniza base de datos local con Supabase Cloud
# ═══════════════════════════════════════════════════════════════════════════════

param(
    [Parameter()]
    [ValidateSet("push", "pull", "status", "reset", "diff", "migration", "functions")]
    [string]$Action = "status",
    
    [Parameter()]
    [string]$MigrationName = "",
    
    [Parameter()]
    [switch]$Force
)

$ErrorActionPreference = "Stop"

# Colores para output
function Write-Title { param($Text) Write-Host "`n═══════════════════════════════════════════════════" -ForegroundColor Cyan; Write-Host " $Text" -ForegroundColor Cyan; Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan }
function Write-Step { param($Text) Write-Host "► $Text" -ForegroundColor Yellow }
function Write-Success { param($Text) Write-Host "✓ $Text" -ForegroundColor Green }
function Write-Error { param($Text) Write-Host "✗ $Text" -ForegroundColor Red }
function Write-Info { param($Text) Write-Host "  $Text" -ForegroundColor Gray }

Write-Title "ROBERT DARIN FINTECH - Supabase Deploy"

# Verificar que estamos en el directorio correcto
if (-not (Test-Path "pubspec.yaml")) {
    Write-Error "Este script debe ejecutarse desde la raíz del proyecto Flutter"
    exit 1
}

# Verificar que Supabase CLI está instalado
try {
    $supabaseVersion = & supabase --version 2>&1
    Write-Info "Supabase CLI: $supabaseVersion"
} catch {
    Write-Error "Supabase CLI no está instalado. Instálalo con: npm install -g supabase"
    Write-Host ""
    Write-Host "Instrucciones de instalación:" -ForegroundColor Cyan
    Write-Host "  Windows: scoop install supabase" -ForegroundColor Gray
    Write-Host "  O: npm install -g supabase" -ForegroundColor Gray
    Write-Host "  O: choco install supabase" -ForegroundColor Gray
    exit 1
}

# Verificar que el proyecto está vinculado
if (-not (Test-Path ".supabase")) {
    Write-Step "El proyecto no está vinculado a Supabase Cloud"
    Write-Host ""
    Write-Host "Para vincular el proyecto ejecuta:" -ForegroundColor Yellow
    Write-Host "  supabase login" -ForegroundColor White
    Write-Host "  supabase link --project-ref TU_PROJECT_REF" -ForegroundColor White
    Write-Host ""
    Write-Host "Puedes obtener el project-ref desde el Dashboard de Supabase" -ForegroundColor Gray
    Write-Host "Settings > General > Reference ID" -ForegroundColor Gray
    
    # Preguntar si quiere vincular ahora
    $response = Read-Host "¿Quieres vincular el proyecto ahora? (s/n)"
    if ($response -eq "s" -or $response -eq "S") {
        Write-Step "Iniciando sesión en Supabase..."
        & supabase login
        
        $projectRef = Read-Host "Ingresa el Project Reference ID"
        if ($projectRef) {
            Write-Step "Vinculando proyecto..."
            & supabase link --project-ref $projectRef
        }
    } else {
        exit 0
    }
}

switch ($Action) {
    "status" {
        Write-Title "Estado del Proyecto"
        
        Write-Step "Verificando conexión con Supabase..."
        & supabase status
        
        Write-Step "Migraciones pendientes..."
        $migrations = Get-ChildItem -Path "supabase/migrations" -Filter "*.sql" | Sort-Object Name
        Write-Host ""
        Write-Host "Migraciones locales:" -ForegroundColor Cyan
        foreach ($m in $migrations) {
            Write-Host "  - $($m.Name)" -ForegroundColor Gray
        }
        Write-Host ""
        Write-Host "Total: $($migrations.Count) migraciones" -ForegroundColor Yellow
    }
    
    "push" {
        Write-Title "Aplicando Migraciones a Supabase Cloud"
        
        if (-not $Force) {
            Write-Host ""
            Write-Host "⚠️  ADVERTENCIA: Esto aplicará todas las migraciones pendientes" -ForegroundColor Yellow
            Write-Host "   a tu base de datos de producción en Supabase Cloud." -ForegroundColor Yellow
            Write-Host ""
            $confirm = Read-Host "¿Continuar? (escribe 'SI' para confirmar)"
            if ($confirm -ne "SI") {
                Write-Info "Operación cancelada"
                exit 0
            }
        }
        
        Write-Step "Aplicando migraciones..."
        & supabase db push
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Migraciones aplicadas correctamente"
        } else {
            Write-Error "Error al aplicar migraciones"
            exit 1
        }
    }
    
    "pull" {
        Write-Title "Descargando Schema de Supabase Cloud"
        
        Write-Step "Obteniendo schema remoto..."
        & supabase db pull
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Schema descargado correctamente"
        } else {
            Write-Error "Error al descargar schema"
            exit 1
        }
    }
    
    "diff" {
        Write-Title "Diferencias entre Local y Remoto"
        
        Write-Step "Comparando schemas..."
        & supabase db diff
    }
    
    "migration" {
        Write-Title "Crear Nueva Migración"
        
        if (-not $MigrationName) {
            $MigrationName = Read-Host "Nombre de la migración (ej: add_new_table)"
        }
        
        # Generar timestamp
        $timestamp = Get-Date -Format "yyyyMMddHHmmss"
        $fileName = "${timestamp}_${MigrationName}.sql"
        $filePath = "supabase/migrations/$fileName"
        
        # Crear archivo de migración
        $template = @"
-- ═══════════════════════════════════════════════════════════════════════════════
-- MIGRACIÓN: $MigrationName
-- Fecha: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
-- Autor: Robert Darin Fintech
-- ═══════════════════════════════════════════════════════════════════════════════

-- Descripción:
-- [Describe aquí qué hace esta migración]

-- ═══════════════════════════════════════════════════════════════════════════════
-- CAMBIOS
-- ═══════════════════════════════════════════════════════════════════════════════

-- [Tu código SQL aquí]

-- ═══════════════════════════════════════════════════════════════════════════════
-- FIN DE MIGRACIÓN
-- ═══════════════════════════════════════════════════════════════════════════════
"@
        
        Set-Content -Path $filePath -Value $template
        Write-Success "Migración creada: $filePath"
        Write-Info "Edita el archivo para agregar tus cambios SQL"
        
        # Abrir en VS Code
        $openVS = Read-Host "¿Abrir en VS Code? (s/n)"
        if ($openVS -eq "s" -or $openVS -eq "S") {
            code $filePath
        }
    }
    
    "reset" {
        Write-Title "Resetear Base de Datos Local"
        
        Write-Host ""
        Write-Host "⚠️  ADVERTENCIA: Esto eliminará TODOS los datos de tu base de datos local" -ForegroundColor Red
        Write-Host "   y aplicará todas las migraciones desde cero." -ForegroundColor Red
        Write-Host ""
        $confirm = Read-Host "¿Continuar? (escribe 'RESET' para confirmar)"
        if ($confirm -ne "RESET") {
            Write-Info "Operación cancelada"
            exit 0
        }
        
        Write-Step "Reseteando base de datos..."
        & supabase db reset
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Base de datos reseteada correctamente"
        } else {
            Write-Error "Error al resetear"
            exit 1
        }
    }
    
    "functions" {
        Write-Title "Desplegar Edge Functions"
        
        Write-Step "Desplegando funciones..."
        & supabase functions deploy
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Funciones desplegadas correctamente"
        } else {
            Write-Error "Error al desplegar funciones"
            exit 1
        }
    }
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host " Operación completada" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
