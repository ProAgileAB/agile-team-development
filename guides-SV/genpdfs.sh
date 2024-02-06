#!/bin/bash

# Default values
PARAMETER_ALL=false
PARAMETER_FILE=false
PARAMETER_FILE_LIST=

while getopts :af:h option
do
    case "${option}"
    in
        a)  PARAMETER_ALL=true;;
        f)  PARAMETER_FILE=true
            PARAMETER_FILE_LIST=${OPTARG};;
        h)  printf "%s: Generate pdf files from md files. By default, one pdf with all chapters and one pdf per chapter will be generated (use arguments to modify). 
        Usage: %s [-a] [-f <file>]
          -a: Generate the combined file with all chapters.
          -f <file>: Generate pdf for <file> only (combine with -a to generate all chapters file also).\n" $0 $0
            exit 2;;
        :)  echo "Invalid option: -$OPTARG requires an argument (use -h for help)"
            exit 1;;
    esac
done

sed -i "/date: /c\date: \"$(date '+%Y-%m-%d')\"" TitlePage.md
sed -i "s/Shared 2018-20[0-9][0-9]/Shared 2018-$(date '+%Y')/" TitlePage.md
sed -i "s/Shared 2018-20[0-9][0-9]/Shared 2018-$(date '+%Y')/" templates/eisvogel.latex

filelist=\
"TitlePage \
A-Team-Development-Framework \
Appreciation-Cards \
Balancing-Team-and-Individual-Work \
Four-stages-of-psychological-safety

GENERATE_COMBINED_FILE=true
if [ $PARAMETER_ALL == true ]; then
    if [ $PARAMETER_FILE == true ]; then
        FILES_TO_GENERATE=$PARAMETER_FILE_LIST
    else
        FILES_TO_GENERATE=
    fi
else
    if [ $PARAMETER_FILE == true ]; then
        GENERATE_COMBINED_FILE=false
        FILES_TO_GENERATE=$PARAMETER_FILE_LIST
    else
        FILES_TO_GENERATE=$filelist
    fi
fi

tmpfiles=""

if [ ! -d tmp ]; then
	mkdir tmp
fi;

echo "Pre-processing of md files to make pdf rendering better"
for f in ${filelist}; 
do
	# Fix problem that HTML generation needs <img> tag while pdf generation needs ![] tag
	# By having only <> tag in files and replacing them with [] before generating pdf
	cat ${f}.md | sed -E 's#<img src="([^"]*)"[^>]*>#!\[\](\1){ width=70%}#g' > tmp/imagesfixed.md ;
	
	# Next add {-} after all header lines. This is a pandoc extension to remove chapter numbering
	cat tmp/imagesfixed.md | sed -E 's/(^#.*)/\1{-}/' > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/tmp-in.md

	# Next add pagebreaks before two specific level two headers that we want to start at separate pages
	cat tmp/tmp-in.md | sed -E 's/(^## Role study.*)/\\pagebreak \n\1/'  > tmp/tmp-out.md ;
	cp tmp/tmp-out.md tmp/tmp-in.md
	
	cp tmp/tmp-out.md tmp/${f}.md 
	
	tmpfiles+="tmp/"${f}.md" ";
done;

for f in ${FILES_TO_GENERATE};
do
    echo "Generating pdf '"${f}".pdf'"
	pandoc tmp/${f}.md -o ../pdf/${f}.pdf --template=templates/eisvogel.latex  ;
done;

if [ $GENERATE_COMBINED_FILE == true ]; then
    FULL_PDF_FILE_NAME=Starting-and-Developing-Agile-Teams
    echo "Generate full pdf '$FULL_PDF_FILE_NAME.pdf'"
    pandoc  \
    $tmpfiles \
    --from markdown \
    --listings \
    --template=templates/eisvogel.latex \
    -o ../pdf/$FULL_PDF_FILE_NAME.pdf --toc --toc-depth=1 --top-level-division=chapter -V secnumdepth=0
fi
