
writePhrase () {
	phrase="$1"
	phraseLength="${#phrase}"
	lastLetter=`expr "$phraseLength" - 1`
	speed="$2"
	case $speed in
		1)
			speed=0.4
			;;
		2)
			speed=0.2
			;;
		3)
			speed=0.1
			;;
		4)
			speed=0.05
			;;
		5)
			speed=0.025
			;;
	esac
	for (( i = 0 ; i < "$phraseLength" ; i++ )) ; do
		letter="${phrase:$i:1}"
		echo -n "$letter"
		sleep $speed
		if [ "$i" -eq "$lastLetter" ] ; then
			echo
		fi
	done
}

askName () {
	if [ "$alreadyAsked" ] ; then
		writePhrase "So, tell me your name." 3
	else
		writePhrase "Hello, what's your name?" 3
		alreadyAsked=1
	fi
	read name
	checkName
}

checkName () {
	writePhrase "Your name is $name. Right? (y/n)" 3
	read answer
	if [ "$answer" = "y" ] ; then
		writePhrase "..." 1
		writePhrase "It sucks!" 3
	else
		if [ "$answer" = "n" ] ; then
			askName
		else
			writePhrase "You should answer yes (y) or no (n)" 3
			checkName
		fi
	fi
}

