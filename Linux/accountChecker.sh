#! /bin/bash

IFS=
shadow="$(cat /etc/shadow)"

while read -r line || [[ -n "$line" ]]
do
	echo -n "$line"
	echo -e $shadow | grep "$(echo $line | cut ':' -f1)" | cut -d ':' -f 2-9
done < /etc/passwd
