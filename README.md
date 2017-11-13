# Hentai@Home on Docker

## Install

replace `/CACHE_DIR`, `/DATA_DIR`, `/DOWNLOAD_DIR`, `/LOG_DIR` and `/TEMP_DIR` for save data, and `YOUR_CLIENT_KEY` for security.

Run command below:

```
sudo docker run -d \
--name docker-hath \
-p 11112:11112 \
-v /CACHE_DIR:/home/hath/client/cache \
-v /DATA_DIR:/home/hath/client/data \
-v /DOWNLOAD_DIR:/home/hath/client/download \
-v /LOG_DIR:/home/hath/client/log \
-v /TEMP_DIR:/home/hath/client/temp \
-e HatH_KEY=YOUR_CLIENT_KEY \
stu43005/docker-hath
```
