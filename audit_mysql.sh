#!/bin/bash

MYSQL_USER='root'
MYSQL_PASSWORD='root_password'
CURRENTDATE=$(date +%d-%m-%Y)
CSV_FILE=mysql_connections_$(date +%d%m%Y).csv

for (( ; ; ))
do
	CURRENTTIME=$(date +%T)

	CONN=$(mysql -B -s -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "show status where variable_name = 'threads_connected'" --skip-column-names | sed 's/Threads_connected//g')

	echo ${CURRENTDATE} ${CURRENTTIME} Connections: ${CONN}

	echo ${CURRENTDATE} ${CURRENTTIME}, ${CONN}, >> ${CSV_FILE}

	# Wait 30 seconds
	sleep 30
done