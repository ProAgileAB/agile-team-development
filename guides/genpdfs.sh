

filelist=\
"Team-Start-Example.md \
Ground-Rules-and-Decision-Making.md \
Journey-Lines.md \
Appreciation-Cards.md \
Product-Goals-for-Teams.md \
Organizational-Goals-for-Teams.md \
Team-Vision.md \
Individual-Goals.md \
Balancing-Team-and-Individual-Work.md \
Market-of-Skills.md \
Repairing-Broken-Agreements.md \
Build-Trust-With-Simple-Questions.md"

tmpfiles=""

#Fix problem that HTML generartion needs <img> tag while pdf generation needs ![] tag
for f in ${filelist}; 
	do cat ${f} | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/${f} ;
	tmpfiles+="tmp/"${f}" ";
done;

#Generate full pdf
pandoc  \
--template=custom-template.latex \
variables.txt \
$tmpfiles \
-o ../pdf/Starting-and-Developing-Agile-Teams.pdf -H style/footer.tex -H header-includes.tex --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0


#Generate per chapter  pdf

for f in ${filelist}; 
	do pandoc tmp/${f} -o ../pdf/${f}.pdf -H style/footer.tex ;
done;

