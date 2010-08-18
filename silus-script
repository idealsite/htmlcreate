clear
frase_uno=(Hi! Whats your name?)
frase_due=(Omg $inputname! Your name sucks!)
echo $fras[1]
function scrivi(){
	frase=$1
	for ((  i = 0 ;  i < ${#frase[*]};  i++  )) ; do
		parola="${frase[$i]}"
		lunghezza=`expr length $parola`
		ultimaLettera=`expr $lunghezza - 1`
		for ((  k = 0 ;  k < ${#parola};  k++  )) ; do
			if [ "$k" -eq "$ultimaLettera" ] ; then
				echo -n "${parola:$k:1} "
				sleep 0.1
			else
				echo -n "${parola:$k:1}"
				sleep 0.1
			fi
		done
	done
	return
}

scrivi $frase_uno
read inputname
exit 0
