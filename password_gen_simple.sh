#!/bin/sh

# Copyright ©2011, Paul Suh
# 
# A short shell script that will print out any desired number of random
# passwords of the form <word1><digit><digit>. 
#
# usage: ./password_gen.sh 5
#
# This example will print out 5 random passwords. 
#
# Included is a filtered word file that includes only words that are
# 6 characters long. You can point the script at the 
# complete word list by changing the WORDFILE variable to point to 
# /usr/share/dict/web2. 
#
# I was considering releasing this script under the GPL or MIT licenses, 
# but in the end it's such a little thing that I'm just releasing it as
# freeware -- use it as you like, but keep the copyright attached to it. 

# WORDFILE=/usr/share/dict/web2
WORDFILE=password_base_6.txt
WC=`wc -l < $WORDFILE`

COUNT=0

while [ $COUNT -lt $1 ] 
do 
	((COUNT++)) 
	NUM1=`jot -r 1 1 $WC`
	WORD1=`head -$NUM1 < $WORDFILE | tail -1`
	
	DIGIT1=`jot -r 1 0 9`
	DIGIT2=`jot -r 1 0 9`
	
	echo ${WORD1}${DIGIT1}${DIGIT2}
done
