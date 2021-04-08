ARG VERSION=4.3-8
FROM jenkins/agent:4.3-8-jdk11-windowsservercore-1809
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols on Windows" Vendor="Jenkins Project" Version="$VERSION"

ARG user=jenkins

RUN $output = net users ; if(-not ($output -match $env:user)) { Write-Host 'user does not exist?' ; net user $env:user /add /expire:never /passwordreq:no ; net localgroup Administrators /add $env:user ;  wmic useraccount WHERE Name=$env:user set PasswordExpires=false; }

COPY jenkins-agent.ps1 C:/ProgramData/Jenkins
USER ${user}
#ENTRYPOINT ["pwsh.exe", "-f", "C:/ProgramData/Jenkins/jenkins-agent.ps1 -Url https://dp-jenkins-nlb-8eee68c47b09d2a9.elb.us-west-2.amazonaws.com -Secret 11a817f804211ece41f0500623a682005c -Name Jnlp-Win"]
