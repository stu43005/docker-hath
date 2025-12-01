FROM anapsix/alpine-java:8
LABEL maintainer="Shiaupiau <stu43005@gmail.com>"
LABEL org.opencontainers.image.title="Hentai@Home Client"
LABEL org.opencontainers.image.description="Docker image for Hentai@Home Client"
LABEL org.opencontainers.image.url="https://e-hentai.org/hentaiathome.php"

ENV HatH_PORT 11112

RUN apk update && \
    apk --no-cache add curl sqlite unzip && \
    mkdir -p /hath && \
    cd /hath && \
    curl -fsSL https://repo.e-hentai.org/hath/HentaiAtHome_1.6.4.zip -o hath.zip && \
    echo -n "25351e4b43169f0bad25abcfe7f61034f03cca08b69f219727713975dc5b03b1  hath.zip" | sha256sum -c && \
    unzip hath.zip && \
    rm hath.zip && \
    apk del curl unzip && \
    mkdir -p /hath/cache && \
    mkdir -p /hath/data && \
    mkdir -p /hath/download && \
    mkdir -p /hath/log && \
    mkdir -p /hath/temp

ADD client/start.sh /hath/start.sh

RUN chmod +x /hath/start.sh

WORKDIR /hath
EXPOSE "$HatH_PORT"
VOLUME ["/hath/cache", "/hath/data", "/hath/download", "/hath/log", "/hath/temp"]
CMD ["/hath/start.sh"]
