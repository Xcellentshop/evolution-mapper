# Script para instalar o Flutter automaticamente
Write-Host "Instalando Flutter..." -ForegroundColor Green

# Criar diretório para o Flutter
$flutterPath = "C:\flutter"
if (!(Test-Path $flutterPath)) {
    New-Item -ItemType Directory -Path $flutterPath -Force
}

# Baixar Flutter
Write-Host "Baixando Flutter..." -ForegroundColor Yellow
$flutterUrl = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip"
$flutterZip = "flutter.zip"

try {
    Invoke-WebRequest -Uri $flutterUrl -OutFile $flutterZip -UseBasicParsing
    Write-Host "Download concluído!" -ForegroundColor Green
} catch {
    Write-Host "Erro no download: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Extrair Flutter
Write-Host "Extraindo Flutter..." -ForegroundColor Yellow
try {
    Expand-Archive -Path $flutterZip -DestinationPath "C:\" -Force
    Write-Host "Extração concluída!" -ForegroundColor Green
} catch {
    Write-Host "Erro na extração: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Limpar arquivo ZIP
Remove-Item $flutterZip -Force

# Adicionar ao PATH
Write-Host "Configurando PATH..." -ForegroundColor Yellow
$flutterBinPath = "$flutterPath\bin"
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")

if ($currentPath -notlike "*$flutterBinPath*") {
    $newPath = "$currentPath;$flutterBinPath"
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    Write-Host "PATH atualizado!" -ForegroundColor Green
}

Write-Host "Instalação do Flutter concluída!" -ForegroundColor Green
Write-Host "Reinicie o terminal para usar o Flutter." -ForegroundColor Yellow 