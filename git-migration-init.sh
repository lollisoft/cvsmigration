#!/bin/sh

rm -rf cvs_migration
rm -rf cvs_migration_old
rm -rf cvs_migration_pascal

mkdir cvs_migration
mkdir cvs_migration_old
mkdir cvs_migration_pascal



cd cvs_migration_pascal/

#git init
git clone git@github.com:lollisoft/pascal.git
git cvsimport -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot PASCAL
git branch -M main
git remote add origin git@github.com:lollisoft/pascal.git
git push -u origin main

##echo "# pascal" >> README.md
#git init
##git add README.md
#git cvsimport -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot PASCAL
##git commit -m "CVS Import"
##git branch -M main
##git remote add origin git@github.com:lollisoft/pascal.git
###git push -u origin main

#git clone git@github.com:lollisoft/pascal.git
#git cvsimport -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot PASCAL
#git remote add origin git@github.com:lollisoft/pascal.git
##git checkout -b main
##git add .
#git commit -m "Freshly imported Pascal"
#git push -u origin main 

cd ..

exit

cd cvs_migration_old/

git clone git@github.com:lollisoft/lbdmf_oldCVSBranch.git
git remote add origin git@github.com:lollisoft/lbdmf_oldCVSBranch.git
#git checkout -b old
#git add .
#git commit -m "New branch"
#git push -u origin old

cd ..

cd cvs_migration/

git clone git@github.com:lollisoft/lbdmf.git
git remote add origin git@github.com:lollisoft/lbdmf.git
#git checkout -b main
#git add .
#git commit -m "New branch"
#git push -u origin main

cd ..
