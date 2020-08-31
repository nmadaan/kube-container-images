FROM mcr.microsoft.com/windows:1809
RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN powershell -Command choco install googlechrome firefox chromedriver selenium-gecko-driver selenium-ie-driver python -y
RUN setx path '%path%;C:\Python38\Scripts'
RUN pip install \
        --no-cache-dir \
        robotframework\
        robotframework-seleniumlibrary \
        robotframework-selenium2library
ADD ie-configuration.ps1 .
RUN powershell -Command C:\ie-configuration.ps1
