#!/usr/bin/env sh

action=$1
num=$2

case "$action" in
	"inc")
		light -A $num
		;;
	"dec")
		light -U $num
		;;
esac

notify-send "Brightness" "The brightbess is now $(light -G)"
