#!/usr/bin/env bash

action=$1
num=$2

case "$action" in
	"inc")
		amixer set Master "$num%+"
		notify-send "Volume" "The volume is now $(amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
		;;
	"dec")
		amixer set Master "$num%-"
		notify-send "Volume" "The volume is now $(amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
		;;
	"toggle")
		amixer set Master toggle
		notify-send "Volume" "The volume is now muted."
		;;
esac
