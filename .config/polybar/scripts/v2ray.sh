#!/bin/sh

# this requires a service for v2ray at /usr/lib/systemd/system
service=$(systemctl is-active v2ray)


case $1 in
	"toggle")
		if [ $service == 'active' ]
		then
			sudo systemctl stop v2ray
			printf '%s' '%{F#4c566a}%{F-}'
		else
			sudo systemctl start v2ray
			printf '%s' '%{F#a3be8c}%{F-}'
		fi
		;;
	"")
		if [ $service == "active" ]
		then
			printf '%s' '%{F#a3be8c}%{F-}'
		else
			printf '%s' '%{F#4c566a}%{F-}'
		fi
esac


