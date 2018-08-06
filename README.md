# rageshell
boostrapping script for adding a proper shell and development utilities on windows 10

- Gathers your email and git user name to populate the .gitconfig it installs.
- Sets the Excecution policy for scripts to RemoteSigned.
- Installs [Jump.Location](https://github.com/tkellogg/Jump-Location) a nice directory jump tool
- Installs [PSColors](https://github.com/ecsousa/PSColors) for colored `ls` and more
- Installs [posh-git](https://github.com/dahlbyk/posh-git) for a great git integration and auto-complete
- Installs [Chocolatey](https://chocolatey.org/) and through that:
  - keepass 
  - kdiff3
  - conemu
  - notepadplusplus
  - visualstudiocode
  - firefox
  - dotnetcore-sdk
  - [git for windows](https://chocolatey.org/packages/git.install), putting all the unix-tools in path.
  - [docker for windows Edge channel](https://store.docker.com/editions/community/docker-ce-desktop-windows)
- Sets up the profile.ps1, setting up the shell parameters and modules on each start of powershell.
- Sets git up for windows 10 use
  - Path to the correct ssh client in win10
  - Notpad++ as the default editor
  - Git username and email
  - Kdiff3 as the mergetool
 - Installs the [Settings sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension for Visual Studio Code, making it easier to bootstrap the rest of your extensions and settings.
