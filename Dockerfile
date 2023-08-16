FROM mono:latest

RUN apt update -yqq \
    && apt install -yqq gpg apt-transport-https \
    && curl -o - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
    && curl -o /etc/apt/sources.list.d/microsoft-prod.list https://packages.microsoft.com/config/debian/9/prod.list \
    && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
                       /etc/apt/sources.list.d/microsoft-prod.list \
    && apt update -yqq \
    && apt install -yqq \
        unzip \
        git \
        dotnet-sdk-3.1 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y xfonts-75dpi xfonts-base
ADD https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb /
#RUN apt install xfonts-75dpi
#RUN apt install libjpeg-turbo8
RUN apt-get update && apt-get install -y ./wkhtmltox_0.12.6-1.buster_amd64.deb

#RUN apt-get update && apt-get install -y wkhtmltopdf

#RUN apt-get update \
#    && apt-get install -y \
#        curl \
#        libxrender1 \
#        libfontconfig \
#        libxtst6 \
#        xz-utils

#RUN curl "https://github.com/wkhtmltopdf/wkhtmltopdf/archive/refs/tags/0.12.6.tar.gz" -L -o "wkhtmltopdf.tar.gz"
#RUN tar Jxvf wkhtmltopdf.tar.gz
#RUN mv wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

ENV PATH="/docfx:${PATH}"
ENTRYPOINT [ "docfx" ]

ADD ./entrypoint.sh /usr/local/bin/docfx

ADD https://github.com/dotnet/docfx/releases/download/v2.70.0/docfx-linux-x64-v2.70.0.zip /
RUN unzip docfx-linux-x64-v2.70.0.zip -d /docfx && \
    rm docfx-linux-x64-v2.70.0.zip
