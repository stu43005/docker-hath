#!/bin/sh
if [ ! -f /hath/data/client_login ]; then
	if [ $HatH_KEY ]; then
		echo "${HatH_KEY}" >> /hath/data/client_login
	fi
fi

java -jar HentaiAtHome.jar --port=$HatH_PORT --cache-dir="/hath/cache" --data-dir="/hath/data" --download-dir="/hath/download" --log-dir="/hath/log" --temp-dir="/hath/temp"
