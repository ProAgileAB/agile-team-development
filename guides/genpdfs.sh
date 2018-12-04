
#Fix problem that HTML generartion needs <img> tag while pdf generation needs ![] tag

cat Individual-Goals.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/Individual-Goals.md
cat Build-Trust-With-Simple-Questions.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/Build-Trust-With-Simple-Questions.md
cat Journey-Lines.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/Journey-Lines.md
cat Market-of-Skills.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1)#g' > tmp/Market-of-Skills.md

#Generate full pdf
pandoc  \
--template=custom-template.latex \
variables.txt \
Team-Start-Example.md \
Ground-Rules-and-Decision-Making.md \
tmp/Journey-Lines.md \
Appreciation-Cards.md \
Product-Goals-for-Teams.md \
Organizational-Goals-for-Teams.md \
Team-Vision.md \
tmp/Individual-Goals.md \
Balancing-Team-and-Individual-Work.md \
tmp/Market-of-Skills.md \
Repairing-Broken-Agreements.md \
tmp/Build-Trust-With-Simple-Questions.md \
-o ../pdf/Starting-and-Developing-Agile-Teams.pdf -H style/footer.tex -H header-includes.tex --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0

pandoc  Team-Start-Example.md -o ../pdf/Team-Start-Example ../pdf/Team-Start-Example.pdf -H style/footer.tex
pandoc  Ground-Rules-and-Decision-Making.md -o ../pdf/Ground-Rules-and-Decision-Making.pdf -H style/footer.tex
pandoc  tmp/Journey-Lines.md -o ../pdf/Journey-Lines.pdf -H style/footer.tex
pandoc  Appreciation-Cards.md -o ../pdf/Appreciation-Cards.pdf -H style/footer.tex
pandoc  Product-Goals-for-Teams.md -o ../pdf/Product-Goals-for-Teams.pdf -H style/footer.tex
pandoc  Organizational-Goals-for-Teams.md -o ../pdf/Organizational-Goals-for-Teams.pdf -H style/footer.tex
pandoc  Team-Vision.md -o ../pdf/Team-Vision.pdf -H style/footer.tex
pandoc  tmp/Individual-Goals.md -o ../pdf/Individual-Goals.pdf -H style/footer.tex
pandoc  Balancing-Team-and-Individual-Work.md -o ../pdf/Balancing-Team-and-Individual-Work.pdf -H style/footer.tex
pandoc  tmp/Market-of-Skills.md -o ../pdf/Market-of-Skills.pdf -H style/footer.tex
pandoc  Repairing-Broken-Agreements.md -o ../pdf/Repairing-Broken-Agreements.pdf -H style/footer.tex
pandoc  tmp/Build-Trust-With-Simple-Questions.md -o ../pdf/Build-Trust-With-Simple-Questions.pdf -H style/footer.tex

