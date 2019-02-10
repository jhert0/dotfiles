#!/usr/bin/env bash

action=$1
num=$2

case "$action" in
	"inc")
		amixer set Master "$num%+"
		notify-send "Volume" "The volume is now $(awk -F"[][]" '/dB/ { print $2 }' <(amixer get Master))"
		;;
	"dec")
		amixer set Master "$num%-"
		notify-send "Volume" "The volume is now $(awk -F"[][]" '/dB/ { print $2 }' <(amixer get Master))"
		;;
	"toggle")
		amixer set Master toggle
		notify-send "Volume" "The volume is now muted."
		;;
esac
