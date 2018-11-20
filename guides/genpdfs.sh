

pandoc --verbose \
Team-Start-Example.md \
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
Build-Trust-With-Simple-Questions.md \
-o ../pdf/Starting-and-Developing-Agile-Teams.pdf -H style/footer.tex --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0

pandoc --verbose Team-Start-Example.md -o ../pdf/Team-Start-Example ../pdf/Team-Start-Example.pdf -H style/footer.tex
pandoc --verbose Ground-Rules-and-Decision-Making.md -o ../pdf/Ground-Rules-and-Decision-Making.pdf -H style/footer.tex
pandoc --verbose Journey-Lines.md -o ../pdf/Journey-Lines.pdf -H style/footer.tex
pandoc --verbose Appreciation-Cards.md -o ../pdf/Appreciation-Cards.pdf -H style/footer.tex
pandoc --verbose Product-Goals-for-Teams.md -o ../pdf/Product-Goals-for-Teams.pdf -H style/footer.tex
pandoc --verbose Organizational-Goals-for-Teams.md -o ../pdf/Organizational-Goals-for-Teams.pdf -H style/footer.tex
pandoc --verbose Team-Vision.md -o ../pdf/Team-Vision.pdf -H style/footer.tex
pandoc --verbose Individual-Goals.md -o ../pdf/Individual-Goals.pdf -H style/footer.tex
pandoc --verbose Balancing-Team-and-Individual-Work.md -o ../pdf/Balancing-Team-and-Individual-Work.pdf -H style/footer.tex
pandoc --verbose Market-of-Skills.md -o ../pdf/Market-of-Skills.pdf -H style/footer.tex
pandoc --verbose Repairing-Broken-Agreements.md -o ../pdf/Repairing-Broken-Agreements.pdf -H style/footer.tex
pandoc --verbose Build-Trust-With-Simple-Questions.md -o ../pdf/Build-Trust-With-Simple-Questions.pdf -H style/footer.tex

