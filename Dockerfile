FROM microsoft/nanoserver:latest as base
WORKDIR /scratch
COPY ["bootstrap.ps1","profile-template-ps1",".gitconfig","./"]

FROM base as test
RUN powershell.exe ./bootstrap.ps1

RUN echo ~/.gitconfig \
    echo ~/Documents/MicrosoftPowersShell/profile.ps1 \
    Get-Command git \
    Get-Command code \