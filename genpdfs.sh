

pandoc \
guides/Team-Start-Example.md \
guides/Ground-Rules-and-Decision-Making.md \
guides/Journey-Lines-Facilitation-Guide.md \
guides/Appreciation-Cards.md \
guides/Product-Goals-for-Teams.md \
guides/Organizational-Goals-for-Teams.md \
guides/Team-Vision.md \
guides/Individual-Goals.md \
guides/Balancing-Team-and-Individual-work.md \
guides/Market-of-skills.md \
guides/Repairing-Broken-Agreements.md \
guides/Build-trust-with-simple-questions.md \
-o pdf/Starting-and-Developing-Agile-Teams.pdf -H guides/style/footer.tex --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0

pandoc guides/Team-Start-Example.md -o pdf/Team-Start-Example.pdf -H guides/style/footer.tex
pandoc guides/Ground-Rules-and-Decision-Making.md -o pdf/Ground-Rules-and-Decision-Making.pdf -H guides/style/footer.tex
pandoc guides/Journey-Lines-Facilitation-Guide.md -o pdf/Journey-Lines-Facilitation-Guide.pdf -H guides/style/footer.tex
pandoc guides/Appreciation-Cards.md -o pdf/Appreciation-Cards.pdf -H guides/style/footer.tex
pandoc guides/Product-Goals-for-Teams.md -o pdf/Product-Goals-for-Teams.pdf -H guides/style/footer.tex
pandoc guides/Organizational-Goals-for-Teams.md -o pdf/Organizational-Goals-for-Teams.pdf -H guides/style/footer.tex
pandoc guides/Team-Vision.md -o pdf/Team-Vision.pdf -H guides/style/footer.tex
pandoc guides/Individual-Goals.md -o pdf/Individual-Goals.pdf -H guides/style/footer.tex
pandoc guides/Balancing-Team-and-Individual-work.md -o pdf/Balancing-Team-and-Individual-work.pdf -H guides/style/footer.tex
pandoc guides/Market-of-skills.md -o pdf/Market-of-skills.pdf -H guides/style/footer.tex
pandoc guides/Repairing-Broken-Agreements.md -o pdf/Repairing-Broken-Agreements.pdf -H guides/style/footer.tex
pandoc guides/Build-trust-with-simple-questions.md -o pdf/Build-trust-with-simple-questions.pdf -H guides/style/footer.tex

