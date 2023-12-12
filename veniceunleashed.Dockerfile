FROM ubuntu:18.04

RUN dpkg --add-architecture i386 \
    && echo 'deb [trusted=yes] http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./' > /etc/apt/sources.list.d/wine.list \
    && apt-get update \
    && apt-get install -yq wget xvfb unzip cabextract winehq-stable winetricks \
    && adduser --home /vu --disabled-login --gecos "" vu

USER vu
WORKDIR /vu
ENV WINEPREFIX=/vu/prefix
ENV WINEARCH=win32
ENV WINEDEBUG=-all
RUN wineboot && xvfb-run winetricks -q vcrun2008

RUN wget -nc https://veniceunleashed.net/files/vu.zip -O /tmp/vu.zip \
    && mkdir -p /vu/client \
    && cd /vu/client \
    && unzip /tmp/vu.zip \
    && rm -rf /tmp/*

ADD server.sh /vu/server.sh
CMD /vu/server.sh

EXPOSE 7948/udp
EXPOSE 25200/udp
EXPOSE 47200/tcp

VOLUME /vu/battlefield
VOLUME /vu/instance
