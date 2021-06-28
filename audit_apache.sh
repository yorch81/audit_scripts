#!/bin/bash

CURRENTDATE=$(date +%d-%m-%Y)
CSV_FILE=apache_connections_$(date +%d%m%Y).csv

for (( ; ; ))
do
	CURRENTTIME=$(date +%T)

	CONN=$(netstat -ant | grep -E ':80|:443' | wc -l)

	echo ${CURRENTDATE} ${CURRENTTIME} Connections: ${CONN}

	echo ${CURRENTDATE} ${CURRENTTIME}, ${CONN}, >> ${CSV_FILE}

	# Wait 30 seconds
	sleep 30
done