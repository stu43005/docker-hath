FROM anapsix/alpine-java:7
MAINTAINER Luis Alvarado <alvaradorocks@gmail.com>

# Common
ENV HatH_VERSION 1.4.2
ENV HatH_DOWNLOAD_URL https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip
ENV HatH_DOWNLOAD_SHA256 da25fdec0a9535b265677a230e5cf84c75f0cfe790cffc51a520cf7cf3b01b2f
ENV HatH_USER hath
ENV HatH_PATH "/home/$HatH_USER/client"
ENV HatH_ARCHIVE hath.zip
ENV HatH_PORT 11112

# Container Setup
RUN apk update && \
    apk --no-cache add curl sqlite unzip && \
    adduser -D "$HatH_USER" && \
    mkdir "$HatH_PATH" && \
    cd "$HatH_PATH" && \
    curl -fsSL "$HatH_DOWNLOAD_URL" -o "$HatH_ARCHIVE" && \
    echo -n ""$HatH_DOWNLOAD_SHA256"  "$HatH_ARCHIVE"" | sha256sum -c && \
    unzip "$HatH_ARCHIVE" && \
    rm "$HatH_ARCHIVE" && \
    mkdir -p "$HatH_PATH/cache" "$HatH_PATH/data" "$HatH_PATH/download" "$HatH_PATH/log" "$HatH_PATH/temp" && \
    chmod -R 775 "$HatH_PATH"

COPY client/ "$HatH_PATH/"

RUN chmod +x "$HatH_PATH/start.sh"

WORKDIR "$HatH_PATH"

# Expose the port
EXPOSE "$HatH_PORT"

VOLUME ["$HatH_PATH/cache", "$HatH_PATH/data", "$HatH_PATH/download", "$HatH_PATH/log", "$HatH_PATH/temp"]

CMD ["$HatH_PATH/start.sh"]
