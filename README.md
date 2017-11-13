# Hentai@Home on Docker

## Install

replace `/CACHE_DIR`, `/DATA_DIR`, `/DOWNLOAD_DIR`, `/LOG_DIR` and `/TEMP_DIR` for save data, and `YOUR_CLIENT_KEY` for security.

Run command below:

```
sudo docker run -d \
--name docker-hath \
-p 11112:11112 \
-v /CACHE_DIR:/hath/cache \
-v /DATA_DIR:/hath/data \
-v /DOWNLOAD_DIR:/hath/download \
-v /LOG_DIR:/hath/log \
-v /TEMP_DIR:/hath/temp \
-e HatH_KEY=YOUR_CLIENT_KEY \
stu43005/docker-hath
```
