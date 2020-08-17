#!/bin/bash

#######################################
#Simple script using pdftk to extract odd 
# and even pages from pdf
#######################################

# check if handled file is a pdf

mtype=$(file --mime-type -b "$1")

if ! echo $mtype | grep -q pdf ; then
	echo "Provided file ist not a pdf! Script is aborted!"
	exit 0
fi

# write filename without extension into variable "usedfile"

usedfile=${1%.pdf}

read -e -p "Beginning of page range for extracting even and odd pages, respectively: " pstart
read -e -p "End of page range for extracting even and odd pages, respectively: " pend

# using pdftk to split pages

pdftk "$1" cat "$pstart"-"$pend"odd  output "${usedfile}_odd.pdf"
pdftk "$1" cat "$pstart"-"$pend"even output "${usedfile}_even.pdf"

# output of information after processing

echo "Even and odd pages in the page range "$pstart"-"$pend" in file ${usedfile}.pdf were extracted to ${usedfile}_odd.pdf and ${usedfile}_even.pdf, respectively."

exit 0
