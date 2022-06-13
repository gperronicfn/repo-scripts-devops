##Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#PowerShell Core
choco install powershell-core -y

#PowerShell Az Module
Install-Module -Name Az -Scope AllUsers -Repository PSGallery -Force

#Build Tools and SQL Package
choco install visualstudio2022buildtools  -y
choco install ssdt17 -y

#Profisee CLU
Set-Location $HOME\Downloads
Invoke-WebRequest -OutFile MasterDataMaestroDesktop_x64.msi -Uri https://mdmdev.commonwealth.com/profisee/api/MasterDataMaestroDesktop_x64.msi
msiexec.exe /I $HOME\Downloads\MasterDataMaestroDesktop_x64.msi

## Download ADO agent
Set-Location C:\
Invoke-WebRequest -OutFile vsts-agent-win-x64-2.204.0.zip -Uri https://vstsagentpackage.azureedge.net/agent/2.204.0/vsts-agent-win-x64-2.204.0.zip
mkdir agent ; cd agent

Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.204.0.zip", "$PWD")

.\config.cmd

