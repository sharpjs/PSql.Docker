FROM mcr.microsoft.com/mssql/server:2019-latest
USER root
RUN apt-get update                                            \
 && apt-get -y install powershell                             \
 && apt-get -y clean                                          \
 && rm -rf /var/lib/apt/lists/*                               \
 && pwsh -nop -noni                                           \
    -c Set-PSRepository PSGallery -InstallationPolicy Trusted \
    \; Install-Module PSql        -AllowPrerelease            \
    \; Install-Module PSql.Deploy -AllowPrerelease
