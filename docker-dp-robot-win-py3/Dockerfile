FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 

RUN powershell -Command choco install -y googlechrome chromedriver python

RUN setx HOMEDRIVE "C:"

COPY requirements_py.txt .

RUN pip3 install --ignore-installed distlib  -r requirements_py.txt

ADD FontsToAdd.tar .

RUN powershell -Command C:\Add-Font.ps1 C:\Fonts

RUN powershell -Command Start-Process -FilePath 'C:\Program Files\Google\Chrome\Application\chrome.exe'
