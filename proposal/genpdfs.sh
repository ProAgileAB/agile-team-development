
	  
pandoc  \
guides/TitlePage.md \
guides/Team-Start-Example.md \
guides/Ground-Rules-and-Decision-Making.md \
guides/Journey-Lines.md \
guides/Appreciation-Cards.md \
guides/Product-Goals-for-Teams.md \
guides/Organizational-Goals-for-Teams.md \
guides/Team-Vision.md \
guides/Individual-Goals.md \
guides/Balancing-Team-and-Individual-Work.md \
guides/Market-of-Skills.md \
guides/Repairing-Broken-Agreements.md \
guides/Build-Trust-With-Simple-Questions.md \
-o pdf/Starting-and-Developing-Agile-Teams.pdf --from markdown --template template/eisvogel.latex \
--listings  -V secnumdepth=0 --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0



pandoc  guides/Team-Start-Example.md -o pdf/Team-Start-Example.pdf  --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Ground-Rules-and-Decision-Making.md -o pdf/Ground-Rules-and-Decision-Making.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Journey-Lines.md -o pdf/Journey-Lines.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Appreciation-Cards.md -o pdf/Appreciation-Cards.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Product-Goals-for-Teams.md -o pdf/Product-Goals-for-Teams.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Organizational-Goals-for-Teams.md -o pdf/Organizational-Goals-for-Teams.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Team-Vision.md -o pdf/Team-Vision.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Individual-Goals.md -o pdf/Individual-Goals.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Balancing-Team-and-Individual-Work.md -o pdf/Balancing-Team-and-Individual-Work.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Market-of-Skills.md -o pdf/Market-of-Skills.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Repairing-Broken-Agreements.md -o pdf/Repairing-Broken-Agreements.pdf --from markdown --template template/eisvogel.latex --listings
pandoc  guides/Build-Trust-With-Simple-Questions.md -o pdf/Build-Trust-With-Simple-Questions.pdf --from markdown --template template/eisvogel.latex --listings

