#!/bin/bash
#You need a list with all the prefixes in allenglish.txt
#and all suffixes in suffix.kek

function_name () {
	suf=$(shuf -n 1 allenglish.txt)
	suf="${suf}$(shuf -n 1 suffix.kek)"
	foo="$(tr '[:lower:]' '[:upper:]' <<< ${suf:0:1})${suf:1}"
	echo $foo
}
for (( c=1; c<=$1; c++ ))
do  
   function_name
done
