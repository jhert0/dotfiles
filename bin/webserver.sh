#!/bin/bash

action=$1
echo "Turning webserver $action"
case $action in
	"on")
		sudo systemctl start nginx.service
		sudo systemctl start php-fpm.service
		sudo systemctl start mariadb.service
		;;
	"off")
		sudo systemctl stop nginx.service
		sudo systemctl stop php-fpm.service
		sudo systemctl stop mariadb.service
		;;
	*)
		echo "Unknown action."
		;;
esac
