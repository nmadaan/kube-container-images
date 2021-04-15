FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex" 

RUN powershell -Command choco install -y googlechrome chromedriver python

COPY requirements_py.txt .

RUN pip3 install --ignore-installed distlib  -r requirements_py.txt

ADD FontsToAdd.tar .

RUN powershell -Command C:\Add-Font.ps1 C:\Fonts
