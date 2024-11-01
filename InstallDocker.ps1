# Vérifier si Docker est déjà installé
if (Get-Command "docker" -ErrorAction SilentlyContinue) {
    Write-Host "Docker est déjà installé."
    docker --version
    exit
}

# Installer les prérequis
Write-Host "Installation des prérequis..."

# Activer le support de la virtualisation
Enable-WindowsOptionalFeature -Online -FeatureName containers -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

# Télécharger Docker Desktop
$dockerUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
$installerPath = "$env:TEMP\DockerInstaller.exe"

Write-Host "Téléchargement de Docker Desktop..."
Invoke-WebRequest -Uri $dockerUrl -OutFile $installerPath

# Installer Docker Desktop
Write-Host "Installation de Docker Desktop..."
Start-Process -FilePath $installerPath -ArgumentList 'install' -Wait

# Vérifier l'état de l'installation
Write-Host "Vérification de l'installation de Docker..."
Start-Sleep -Seconds 10  # Attendre un peu que Docker démarre
docker --version

# Nettoyer l'installeur
Remove-Item $installerPath -Force
Write-Host "Installation terminée."
