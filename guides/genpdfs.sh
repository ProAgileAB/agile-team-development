#!/bin/bash

filelist=\
"TitlePage \
A-Team-Development-Framework \
Team-Start-Example \
Ground-Rules-and-Decision-Making \
Journey-Lines \
Appreciation-Cards \
Product-Goals-for-Teams \
Organizational-Goals-for-Teams \
Team-Vision \
Individual-Goals \
Balancing-Team-and-Individual-Work \
Market-of-Skills \
Repairing-Broken-Agreements \
Build-Trust-With-Simple-Questions \
Clarifying-Team-Mandate \
Roles-and-Expectations"

tmpfiles=""

if [ ! -d tmp ]; then
	mkdir tmp
fi;

echo "Pre-processing of md files to make pdf rendering better"
for f in ${filelist}; 
do
	# Fix problem that HTML generartion needs <img> tag while pdf generation needs ![] tag
	# By having only <> tag in files and replacing them with [] before generating pdf
	cat ${f}.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1){ width=70%}#g' > tmp/imagesfixed.md ;
	
	# Next add {-} after all header lines. This is a pandoc extension to remove chapter numbering
	cat tmp/imagesfixed.md  | sed  -E 's/(^#.*)/\1{-}/'  > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/tmp-in.md

	# Next add pagebreaks before two specific level two headers that we want to start at separate pages
	cat tmp/tmp-in.md  | sed  -E 's/(^## Role study.*)/\\pagebreak \n\1/'  > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/tmp-in.md
	
	cp tmp/tmp-out.md tmp/${f}.md 
	
	tmpfiles+="tmp/"${f}.md" ";
done;

echo "Generate full pdf"
pandoc  \
$tmpfiles \
--from markdown \
--listings \
--template=templates/eisvogel.latex \
-o ../pdf/Starting-and-Developing-Agile-Teams.pdf --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0

echo "Generate per chapter pdf"
for f in ${filelist};
do
    echo " Generating pdf for "${f}
	pandoc tmp/${f}.md -o ../pdf/${f}.pdf --template=templates/eisvogel.latex  ;
done;
