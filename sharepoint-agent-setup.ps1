##Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#PowerShell Core
choco install powershell-core -y

#PowerShell Az Module
Install-Module -Name Az -Scope AllUsers -Repository PSGallery -Force

#Build Tools and SQL Package
choco install visualstudio2022buildtools  -y

#VS Test Build Tools
choco install visualstudio2019testagent


## Download ADO agent
Set-Location $HOME\Downloads
Invoke-WebRequest -OutFile vsts-agent-win-x64-2.204.0.zip -Uri https://vstsagentpackage.azureedge.net/agent/2.204.0/vsts-agent-win-x64-2.204.0.zip
Set-Location C:\
mkdir agent ; cd agent

Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.204.0.zip", "$PWD")

.\config.cmd
