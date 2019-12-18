
filelist=\
"TitlePage \
A-Team-Development-Framework \
Team-Start-Example"


#filelist=\
#"TitlePage \
#A-Team-Development-Framework \
#Team-Start-Example \
#round-Rules-and-Decision-Making \
#Journey-Lines \
#Appreciation-Cards \
#Product-Goals-for-Teams \
#Organizational-Goals-for-Teams \
#Team-Vision \
#Individual-Goals \
#Balancing-Team-and-Individual-Work \
#Market-of-Skills \
#Repairing-Broken-Agreements \
#Build-Trust-With-Simple-Questions"

tmpfiles=""

if [ ! -d tmp ]; then
	mkdir tmp
fi;


# Perform some pre-processing of md files to make pdf rendering better
for f in ${filelist}; 
	# Fix problem that HTML generartion needs <img> tag while pdf generation needs ![] tag
	# By having only <> tag in files and replacing them with [] before generating pdf
	do cat ${f}.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1){ width=70%}#g' > tmp/imagesfixed.md ;
	
	# Next add {-} after all header lines. This is a pandc extension to remove chapter numbering
	cat tmp/imagesfixed.md  | sed  -E 's/(^#.*)/\1{-}/'  > tmp/headersfixed.md ;

	# Next add pagebreaks before two specific level two headers that we want to start at separate pages
	cat tmp/headersfixed.md  | sed  -E 's/(^## Role study.*)/\\pagebreak\n\1/'  > tmp/${f}.md ;
		
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

