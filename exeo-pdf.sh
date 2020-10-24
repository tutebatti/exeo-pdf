#!/bin/bash

#######################################
#
# Simple script to extract
# odd and even pages from pdf
#
# Based on and requires pdftk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
#
#######################################

# check if handled file is a pdf

mtype=$(file --mime-type -b "$1")

if ! echo $mtype | grep -q pdf ; then
	echo "Provided file ist not a pdf! Script is aborted!"
	exit 0
fi

read -e -p "Beginning of page range for extracting even and odd pages: " pstart
read -e -p "End of page range for extracting even and odd pages: " pend

# using pdftk to split pages

pdftk "$1" cat "$pstart"-"$pend"odd  output "${1%.pdf}_odd.pdf"
pdftk "$1" cat "$pstart"-"$pend"even output "${1%.pdf}_even.pdf"

echo "Even and odd pages in the page range "$pstart"-"$pend" in file ${1%.pdf}.pdf were extracted to ${1%.pdf}_odd.pdf and ${1%.pdf}_even.pdf, respectively."

exit 0
