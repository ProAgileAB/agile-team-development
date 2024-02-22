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

# Mac
sed -i '' "/date: /c\\
date: \"$(date '+%Y-%m-%d')\"" TitlePage.md

sed -i '' "s/Shared 2018-20[0-9][0-9]/Shared 2018-$(date '+%Y')/" TitlePage.md
sed -i '' "s/Shared 2018-20[0-9][0-9]/Shared 2018-$(date '+%Y')/" templates/eisvogel.latex

# Linux
#sed '' -i "/date: /c\date: \"$(date '+%Y-%m-%d')\"" TitlePage.md
#sed '' -i "s/Shared 2018-20[0-9][0-9]/Shared 2018-$(date '+%Y')/" TitlePage.md
#sed '' -i "s/Shared 2018-20[0-9][0-9]/Shared 2018-$(date '+%Y')/" templates/eisvogel.latex

