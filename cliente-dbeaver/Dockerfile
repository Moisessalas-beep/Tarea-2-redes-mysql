
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates wget \
    libgtk-3-0t64 \
    libxtst6 \
    libxi6 \
    libxrender1 && \
    wget -q \
    https://github.com/dbeaver/dbeaver/releases/download/26.2.4/dbeaver-ce-26.2.4-linux-x86_64.deb \
    -O /tmp/dbeaver.deb && \
    apt-get install -y /tmp/dbeaver.deb && \
    rm -f /tmp/dbeaver.deb && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -l dbeaver -d /home/dbeaver -m ubuntu

USER dbeaver
WORKDIR /home/dbeaver

ENV GDK_BACKEND=x11

CMD ["dbeaver"]
