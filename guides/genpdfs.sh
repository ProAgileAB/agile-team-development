

filelist=\
"Team-Start-Example \
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
for f in ${filelist}; 
	do cat ${f}.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/${f}.md ;
	tmpfiles+="tmp/"${f}.md" ";
done;

#Generate full pdf
pandoc  \
--template=custom-template.latex \
variables.txt \
$tmpfiles \
-o ../pdf/Starting-and-Developing-Agile-Teams.pdf -H style/footer.tex -H header-includes.tex --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0


#Generate per chapter  pdf

for f in ${filelist}; 
	do pandoc tmp/${f}.md -o ../pdf/${f}.pdf -H style/footer.tex ;
done;

