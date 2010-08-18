
clear
frase=(modafucka aaa)

wordCount=${#frase}
lastWord=`expr $wordCount - 1`
for (( i = 0 ; i < $wordCount ; i++ )) ; do
	word=${frase[$i]}
	wordLength=`expr length $word`
	lastLetter=`expr $wordLength - 1`
	for (( j = 0 ;  j < $wordLength ; j++ )) ; do
		echo -n "${word:$j:1}"
		sleep 0.1
		if [ "$j" -eq "$lastLetter" ] ; then
			echo -n " "
		fi
	done
	if [ "$i" -eq "$lastWord" ] ; then
		echo
	fi
done
exit 0

