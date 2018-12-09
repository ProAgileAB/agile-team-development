

filelist=\
"TitlePage \
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
Build-Trust-With-Simple-Questions"

tmpfiles=""

if [ ! -d tmp ]; then
	mkdir tmp
fi;

#Fix problem that HTML generartion needs <img> tag while pdf generation needs ![] tag
#By having only <> tag in files and replacing them with [] before generating pdf
# Next add {-} after all header lines. This is a pandc extension to remove chapter numbering
for f in ${filelist}; 
	do cat ${f}.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/imagesfixed.md ;
	cat tmp/imagesfixed.md  | sed  -E 's/(^#.*)/\1{-}/'  > tmp/${f}.md ;
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

