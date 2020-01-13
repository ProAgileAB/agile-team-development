
#filelist=\
#"TitlePage \
#A-Team-Development-Framework \
#Team-Start-Example"


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
Clarifying-Team-Mandate"

tmpfiles=""

if [ ! -d tmp ]; then
	mkdir tmp
fi;


headerlist=\
"## Role study \
## What is a successful team? \
## The Framework \
## Timely and Trustworthy \
# The Six Key \
## Clear and Significant \
## Design of Team \
## Activities for Teambuilding \
## Infrastructure and Support"


# Perform some pre-processing of md files to make pdf rendering better
for f in ${filelist}; 
	# Fix problem that HTML generartion needs <img> tag while pdf generation needs ![] tag
	# By having only <> tag in files and replacing them with [] before generating pdf
	do cat ${f}.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1){ width=70%}#g' > tmp/imagesfixed.md ;
	
	# Next add {-} after all header lines. This is a pandc extension to remove chapter numbering
	cat tmp/imagesfixed.md  | sed  -E 's/(^#.*)/\1{-}/'  > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/tmp-in.md

	# Next add pagebreaks before two specific level two headers that we want to start at separate pages
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## What is a successful team?.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## The Framework.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md
	
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^# The Six Key.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## Clear and Significant.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md
	
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## Design of Team.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## Activities for Teambuilding.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md
	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## Infrastructure and Support.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	#cp tmp/tmp-out.md tmp/tmp-in.md

	cat tmp/tmp-in.md  | sed  -E 's/(^## Role study.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/tmp-in.md

	
	#cat tmp/tmp-in.md  | sed  -E 's/(^## Timely and Trustworthy.*)/\\pagebreak\n\1/'  > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/${f}.md 
	
	tmpfiles+="tmp/"${f}.md" ";

done;


#Generate full pdf
pandoc  \
$tmpfiles \
--from markdown \
--listings \
--template=templates/eisvogel.latex \
-o ../pdf/Starting-and-Developing-Agile-Teams.pdf --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0


#Generate per chapter  pdf

for f in ${filelist}; 
	do pandoc tmp/${f}.md -o ../pdf/${f}.pdf --template=templates/eisvogel.latex  ;
done;

