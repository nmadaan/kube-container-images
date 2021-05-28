FROM nexus3.spe.sony.com:8421/windows/servercore:ltsc2019

RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 

RUN powershell -Command choco install -y googlechrome chromedriver python git

RUN setx HOMEDRIVE "C:"

COPY requirements_py.txt .

RUN pip3 install --ignore-installed distlib  -r requirements_py.txt

ADD FontsToAdd.tar .

RUN powershell -Command C:\Add-Font.ps1 C:\Fonts

ADD ca.crt .

RUN powershell -Command Import-Certificate -FilePath "C:\ca.crt" -CertStoreLocation Cert:\LocalMachine\Root

LABEL com.sony.spe.owner=ees_internal@spe.sony.com
LABEL com.sony.spe.repo=https://github-scm.spe.sony.com/spe/docker-dp-robot-win-py3
LABEL com.sony.spe.application=decentralized-pipeline
