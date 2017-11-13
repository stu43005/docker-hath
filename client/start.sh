#!/bin/sh
if [ ! -f /home/hath/client/data/client_login ]; then
	if [ $HatH_KEY ]; then
		echo "${HatH_KEY}" >> /home/hath/client/data/client_login
	fi
fi

java -jar HentaiAtHome.jar --port $HatH_PORT --cache-dir "/home/hath/client/cache" --data-dir "/home/hath/client/data" --download-dir "/home/hath/client/download" --log-dir "/home/hath/client/log" --temp-dir "/home/hath/client/temp"
