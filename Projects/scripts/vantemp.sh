#!/usr/bin/env bash
#
# Gets YVR's latest temperature
#
#
check=true

if [ -f ~/.lasttemp ]; then
	latest=$(cat ~/.lasttemp | sed -e 's/^\(.*\)@.*/\1/')

	thn=$(date -j -f '%s' "$latest" +'%s')
	now=$(date +'%s')
	threshold=600
	diff=$(echo "$thn - $now" | bc)

	if [ $diff -gt $threshold ]; then check=true; else check=false; fi
fi

if $check; then
	temp=$(curl http://weather.noaa.gov/weather/current/CYVR.html 2>/dev/null | grep Temperature -A2 -m1 | tail -n 1 | sed -e 's/.*(\(.*\)).*/\1/' -e 's/ /°/' | tr -d '[:space:]')

	echo "$(date +'%s')@$temp" > ~/.lasttemp
	echo $temp
else
	cat ~/.lasttemp | sed -e 's/.*@\(.*\)$/\1/'
fi


