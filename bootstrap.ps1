param (
    [string]$GitName = "Gitte Usersdottir",
    [string]$GitEmail = "no-user@example.com"
    )
 
$ = Read-Host -Prompt 'Input your name'
$GitEmail = Read-Host -Prompt 'Input your email address'#Requires -RunAsAdministrator
Write-Host "Setting up your computer"
#Change script excecution policy
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force;

#Updating packageproviders and adding some useful PowerShell modules
Install-PackageProvider Nuget –Force
Install-Module Jump.Location
Install-Module PSColors
Install-Module posh-git

#Install chocolatey
Invoke-Expression "((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))";
Set-Variable "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin";
#Install applications
chocolatey.exe install -y 7zip keepass kdiff3 conemu notepadplusplus visualstudiocode firefox dotnetcore-sdk -y;
chocolatey.exe install git.install --params "/GitAndUnixToolsOnPath /SChannel /WindowsTerminal /NoShellIntegration"
chocolatey.exe install docker-for-windows --pre -y
#Create the profile.ps1 if it does not exist
if (!(Test-Path -Path $PROFILE)){ New-Item -Path $PROFILE -ItemType File };
#Append the awesome profile
Get-Content profile-template.ps1 >> $PROFILE

#Copy a sane .gitconfig
Copy-Item .gitconfig ~/.gitconfig

git config --global user.name  $GitName
git config --global user.email  $GitEmail
git config --global core.editor "'$env:SystemDrive/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
git config --global core.sshCommand "$env:SystemDrive/WINDOWS/System32/OpenSSH/ssh.exe"

#Set up the vscode settings sync extension. Use this to source your settings from previous installations
code.cmd --install-extension Shan.code-settings-sync