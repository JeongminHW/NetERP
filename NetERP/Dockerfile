# 컨테이너를 빌드하거나 실행할 호스트 컴퓨터의 운영 체제에 따라 FROM 문에 지정된 이미지를 변경해야 할 수 있습니다.
# 자세한 내용은 https://aka.ms/containercompat를 참조하세요.

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
ARG source
WORKDIR /inetpub/wwwroot
COPY ${source:-obj/Docker/publish} .
