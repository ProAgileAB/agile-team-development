

pandoc \
--template=std-latex-template \
variables.txt \
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
