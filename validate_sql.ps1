# Script de validacion CORREGIDO del SQL
$file = "c:\Users\rober\Desktop\robertdarin\database_schema.sql"
$lines = Get-Content $file
$content = Get-Content $file -Raw

Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host "   VALIDACION COMPLETA DE database_schema.sql" -ForegroundColor Cyan  
Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Contar elementos
$tableCount = ([regex]::Matches($content, 'CREATE TABLE IF NOT EXISTS')).Count
$indexCount = ([regex]::Matches($content, 'CREATE INDEX')).Count
$policyCount = ([regex]::Matches($content, 'CREATE POLICY')).Count
$functionCount = ([regex]::Matches($content, 'CREATE OR REPLACE FUNCTION')).Count

Write-Host "ESTADISTICAS:" -ForegroundColor Yellow
Write-Host "   Lineas totales: $($lines.Count)"
Write-Host "   Tablas (CREATE TABLE): $tableCount"
Write-Host "   Indices: $indexCount"
Write-Host "   Politicas RLS: $policyCount"
Write-Host "   Funciones: $functionCount"
Write-Host ""

# 2. Verificar sintaxis invalida
Write-Host "VERIFICACION DE SINTAXIS POSTGRESQL:" -ForegroundColor Yellow
$syntaxErrors = @()
if($content -match 'CREATE POLICY IF NOT EXISTS') { $syntaxErrors += "CREATE POLICY IF NOT EXISTS" }
if($content -match 'CREATE TRIGGER IF NOT EXISTS') { $syntaxErrors += "CREATE TRIGGER IF NOT EXISTS" }
if($content -match 'CREATE FUNCTION IF NOT EXISTS') { $syntaxErrors += "CREATE FUNCTION IF NOT EXISTS" }
if($content -match 'AUTO_INCREMENT|AUTOINCREMENT') { $syntaxErrors += "AUTO_INCREMENT (MySQL)" }
if($content -match 'MODIFY COLUMN') { $syntaxErrors += "MODIFY COLUMN (MySQL)" }

if($syntaxErrors.Count -eq 0) {
    Write-Host "   OK - Sin errores de sintaxis" -ForegroundColor Green
} else {
    foreach($err in $syntaxErrors) { Write-Host "   ERROR: $err" -ForegroundColor Red }
}
Write-Host ""

# 3. Verificar FK a tablas que existen
Write-Host "VERIFICACION DE FOREIGN KEYS:" -ForegroundColor Yellow
$tables = [regex]::Matches($content, 'CREATE TABLE IF NOT EXISTS (\w+)') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique
$refs = [regex]::Matches($content, 'REFERENCES (\w+)\(') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique
$missing = $refs | Where-Object { $tables -notcontains $_ -and $_ -ne 'storage' }
if($missing.Count -eq 0) {
    Write-Host "   OK - Todas las FK apuntan a tablas definidas" -ForegroundColor Green
} else {
    Write-Host "   ERROR - Tablas NO definidas:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host "      - $_" -ForegroundColor Red }
}
Write-Host ""

# 4. Verificar orden (PRIMERA ocurrencia de cada tabla)
Write-Host "VERIFICACION DE ORDEN DE CREACION:" -ForegroundColor Yellow
$tableFirstLine = @{}
$lineNum = 0
foreach($line in $lines) {
    $lineNum++
    if($line -match 'CREATE TABLE IF NOT EXISTS (\w+)') {
        $t = $matches[1]
        if(-not $tableFirstLine.ContainsKey($t)) {
            $tableFirstLine[$t] = $lineNum
        }
    }
}

$orderErrors = @()
$lineNum = 0
foreach($line in $lines) {
    $lineNum++
    $refs = [regex]::Matches($line, 'REFERENCES (\w+)\(')
    foreach($ref in $refs) {
        $t = $ref.Groups[1].Value
        if($tableFirstLine.ContainsKey($t) -and $tableFirstLine[$t] -gt $lineNum) {
            $orderErrors += "L$lineNum -> '$t' (creada en L$($tableFirstLine[$t]))"
        }
    }
}

if($orderErrors.Count -eq 0) {
    Write-Host "   OK - Orden de dependencias correcto" -ForegroundColor Green
} else {
    Write-Host "   ERROR - Referencias antes de creacion:" -ForegroundColor Red
    $orderErrors | Select-Object -First 5 | ForEach-Object { Write-Host "      $_" -ForegroundColor Red }
}
Write-Host ""

# 5. Indices sin IF NOT EXISTS
Write-Host "VERIFICACION DE INDICES:" -ForegroundColor Yellow
$badIndexes = @()
$lineNum = 0
foreach($line in $lines) {
    $lineNum++
    if($line -match '^CREATE INDEX ' -and $line -notmatch 'IF NOT EXISTS') {
        $badIndexes += "L$lineNum"
    }
}
if($badIndexes.Count -eq 0) {
    Write-Host "   OK - Todos los indices son idempotentes" -ForegroundColor Green
} else {
    Write-Host "   ADVERTENCIA - $($badIndexes.Count) indices sin IF NOT EXISTS" -ForegroundColor Yellow
}
Write-Host ""

# 6. Politicas duplicadas
Write-Host "VERIFICACION DE POLITICAS:" -ForegroundColor Yellow
$policies = [regex]::Matches($content, 'CREATE POLICY\s+["\x27](\w+)["\x27]') | ForEach-Object { $_.Groups[1].Value }
$dups = $policies | Group-Object | Where-Object { $_.Count -gt 1 }
if($dups.Count -eq 0) {
    Write-Host "   OK - Sin politicas duplicadas" -ForegroundColor Green
} else {
    Write-Host "   ADVERTENCIA - $($dups.Count) politicas duplicadas" -ForegroundColor Yellow
    $dups | ForEach-Object { Write-Host "      - $($_.Name) (x$($_.Count))" -ForegroundColor Yellow }
}
Write-Host ""

# RESUMEN
Write-Host "===============================================================" -ForegroundColor Cyan
$errors = $syntaxErrors.Count + $missing.Count + $orderErrors.Count
if($errors -eq 0) {
    Write-Host "   VALIDACION EXITOSA" -ForegroundColor Green
    Write-Host "   El SQL esta listo para ejecutar en Supabase" -ForegroundColor Green
} else {
    Write-Host "   $errors ERRORES encontrados" -ForegroundColor Red
}
Write-Host "===============================================================" -ForegroundColor Cyan
