#!/bin/sh

case $1 in
	1)
		./setup-dirs.sh
		;;
	2)
		./setup-links.sh
		;;
	*)
		echo "Please specify a number"
		exit 1
esac
