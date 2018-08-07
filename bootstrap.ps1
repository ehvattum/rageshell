param (
    [string]$GitName = "Gitte Usersdottir",
    [string]$GitEmail = "no-user@example.com"
    )

Write-Host "Setting up your computer"
Write-Host
Write-Host "Change script excecution policy"
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force;

Write-Host "Updating packageproviders and adding some useful PowerShell modules"
Install-PackageProvider Nuget
Install-Module Jump.Location
Install-Module PSColors
Install-Module posh-git

Write-Host "Install chocolatey"
Invoke-Expression "((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))";
Set-Variable "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin";
Write-Host "Installing applications: 7zip keepass kdiff3 conemu notepadplusplus visualstudiocode firefox dotnetcore-sdk"
chocolatey.exe install -y 7zip keepass kdiff3 conemu notepadplusplus visualstudiocode firefox dotnetcore-sdk;
Write-Host "Installing git"
chocolatey.exe install git.install --params "/GitAndUnixToolsOnPath /SChannel /WindowsTerminal /NoShellIntegration"
Write-Host "Installing docker-for-windows"
chocolatey.exe install docker-for-windows --pre -y
Write-Host "Create the profile.ps1 if it does not exist"
if (!(Test-Path -Path $PROFILE)){ New-Item -Path $PROFILE -ItemType File };
Write-Host "Append the awesome profile"
Get-Content profile-template.ps1 >> $PROFILE

Write-Host "Copy a sane .gitconfig"
Copy-Item .gitconfig ~/.gitconfig

git config --global user.name  $GitName
git config --global user.email  $GitEmail
git config --global core.editor "'$env:SystemDrive/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
git config --global core.sshCommand "$env:SystemDrive/WINDOWS/System32/OpenSSH/ssh.exe"

Write-Host "Set up the vscode settings sync extension. Use this to source your settings from previous installations"
code.cmd --install-extension Shan.code-settings-sync
