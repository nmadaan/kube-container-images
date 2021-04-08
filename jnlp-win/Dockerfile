ARG VERSION=4.7-1
FROM jenkins/agent:${VERSION}-jdk11-nanoserver-1809
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols on Windows" Vendor="Jenkins Project" Version="$VERSION"

ARG user=jenkins

RUN $output = net users ; if(-not ($output -match $env:user)) { Write-Host 'user does not exist?' ; net user $env:user /add /expire:never /passwordreq:no ; net localgroup Administrators /add $env:user ;  wmic useraccount WHERE Name=$env:user set PasswordExpires=false; }

COPY jenkins-agent.ps1 C:/ProgramData/Jenkins
USER ${user}
ENTRYPOINT ["pwsh.exe", "-f", "C:/ProgramData/Jenkins/jenkins-agent.ps1 -Url https://dp-jenkins-nlb-72ad43dd52c72fb8.elb.us-west-2.amazonaws.com -Secret 119fecfce7c7e3de10ece6e3a9c5c03d31 -Name Jnlp-Win"]
