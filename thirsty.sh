#!/bin/bash
#Author: Sara Kendig
#Date: 2/27/23
#Purpose: for loop response to the question prompt
echo -n "Are you thirsty? "
read thirsty_answer
thirsty_answer_lc=`echo $thirsty_answer | tr '[A-Z]' '[a-z]'`
while [ "thirsty_answer_lc" !="yes" -o "$thirsty_answer_lc" !="no" ]; do
    echo -n "Are you thirsty? (It's a yes or no question) "
    read thirsty_answer
    thirsty_answer_lc=`echo $thirsty_answer | tr '[A-Z]' '[a-z]'`
done
if [ $thirsty_answer_lc == "yes" ]; then
    echo "What are you thirsty for? "
	read drink
	drink_lc=`echo $drink | tr '[A-Z]' '[a-z]'`
	if [ $drink_lc == "water" ]; then
		echo "Clear crisp and refreshing."
	elif [ $drink_lc == "beer" ]; then
		echo "Let me see some id."
	elif [ $drink_lc == "wine" ]; then
		echo "one box or two?"
	else
		echo "Coming right up"
elif [ "$thirsty_answer_lc" = "no" ]; then
	echo "Not thirsty yet? Come back when you are."
else
	echo "Please answer yes or no"
fi
