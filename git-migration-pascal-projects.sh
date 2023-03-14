#!/bin/sh

rm -rf pascal

# Get an empty git repo and create an initial file in the very past before any cvs timestamps
git clone git@github.com:lollisoft/pascal.git 
cd pascal
echo "This is a migration from my old CVS PASCAL repository." >> README.md
git add README.md
git commit -m "First commit" --date="1980-01-01 00:00:00"
git branch -M main
git push
cd ..


rm -rf project.cvs
mkdir project.cvs    
cd pascal 
cd ../project.cvs
git cvsimport -o main -C ../pascal -k -d :pserver:lothar@cvsserver.behrens.de:/home/cvsroot PASCAL
cd ..
cd pascal
git branch -M main
git push
git push origin --tags
echo Cleanup
rm -rf pascal
rm -rf project.cvs
echo I am ready
