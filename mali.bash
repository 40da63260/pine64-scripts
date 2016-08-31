#!/bin/bash

declare -i warinfo

warinfo=0

noWarranty(){
	echo ""
	echo "This doesn't come with a warranty! In fact, it comes with a big non-warranty!
By using this you are assuming things will go horribly wrong - AND - AND
- you will not complain on the forums or subreddits feel free to hit me up 
on github - if you have suggestions - complaints no thanks"
	echo ""
	echo "Do you understand?[y = yes] "
	read affirmation
	if echo "$affirmation" | grep -iq "^y"
	then
	echo $((++warinfo)) > /dev/null
	fi
}

noWarranty
noWarranty
if [ "$warinfo" -ge 2 ];
then
compileIt
else
echo "no soup for you"
fi
