# Building for Windows
## Install pandoc
https://pandoc.org/installing.html

## Install TeX/LaTeX
https://miktex.org/howto/install-miktex

# Building instruction for Linux
## Installing required software
On debian system or based system, required dependencies are installing using

       apt install texlive texlive-extra-utils texlive-latex-extra texlive-fonts-extra 

# Building for Mac
## Install package manager
Install prefered package manager, for example Homebrew

## Install pandoc
brew install pandoc-citeproc

## Install MacTeX
brew cask install mactex

# Adding a new module
- When a new guide has been added, add it to genpdfs.sh script 
- After updates, run "bash genpdfs.sh" and upload new pdfs
- Update README.md which is the index file view online
