
clear

writePhrase () {
	phrase="$1"
	phraseLength="${#phrase}"
	lastLetter=`expr "$phraseLength" - 1`
	for (( i = 0 ; i < "$phraseLength" ; i++ )) ; do
		letter="${phrase:$i:1}"
		echo -n "$letter"
		sleep 0.1
		if [ "$i" -eq "$lastLetter" ] ; then
			echo
		fi
	done
}

writePhrase "what the hell is going on?"

exit 0

