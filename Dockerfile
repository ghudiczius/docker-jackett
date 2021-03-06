FROM debian:10.2

ARG VERSION

RUN apt-get update --quiet && \
    apt-get --assume-yes --quiet install curl libicu63 && \
    groupadd --gid=1000 jackett && \
    useradd --gid=1000 --home-dir=/opt/jackett --no-create-home --shell /bin/bash --uid 1000 jackett && \
    mkdir /data /downloads /opt/jackett && \
    curl --location --output /tmp/jackett.tar.gz --silent "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" && \
    tar xzf /tmp/jackett.tar.gz --directory=/opt/jackett --strip-components=1 && \
    chown --recursive 1000:1000 /data /downloads /opt/jackett && \
    rm /tmp/jackett.tar.gz

USER 1000
VOLUME /data /downloads
WORKDIR /home/jackett

EXPOSE 9117
ENTRYPOINT ["/opt/jackett/jackett", "--DataFolder=/data"]
