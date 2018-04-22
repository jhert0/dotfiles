#!/usr/bin/env sh

action=$1
num=$2

case "$action" in
	"inc")
		amixer -D pulse sset Master $1+
		notify-send "Volume" "The volume is now $(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))"
		;;
	"dec")
		amixer -D pulse sset Master $1-
		notify-send "Volume" "The volume is now $(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))"
		;;
	"mute")
		amixer -D pulse sset Master mute
		notify-send "Volume" "The volume is now muted."
		;;
	"unmute")
		amixer -D pulse sset Master unmute
		notify-send "Volume" "The volume is now unmuted."
		;;
esac
