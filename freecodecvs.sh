#!/bin/bash

############################################################
#Version:  1.1                                             #
#Development by - Leonardo Costa (lccoder.php@gmail.com) #
#Date: 2018-03-13 $			                   #
############################################################

if [ ! -d $HOME/createcvs ]
then
	mkdir $HOME/createcvs

	if [ $? -eq 0  ]
	then
		echo -e "create DIR: $HOME/createcvs success. \n"
		echo -e "DIR ok, execute scritp again."
		exit 0
	else
		echo -e "don't create DIR :(\n"
		exit ;
	fi	
fi

cd  $HOME/createcvs

echo -e "Enter with to the file name. File TXT in DIR:createcvs. The items must be separate with TAB. : "
read FILETXT

echo -e "Enter with shortname: "
read SHORTNAME

cat $FILETXT | cut -f1 -d '	' | sed 's/\(.*\)/\1;\1/' >  idreg

cat $FILETXT | cut -f2- -d '	' > datain

paste idreg datain | sed 's/	/;/g' > users

cat users | sed 's/ /;/'| sed 's/   /;/g' |sed -e "s/$/;$SHORTNAME;;/g"  | sed -e 's/;$/student/g' > resultusers.cvs

rm -fv idreg datain users

echo -e "CVS file created successful! :) \n"

exit 2

