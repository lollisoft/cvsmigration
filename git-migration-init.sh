#!/bin/sh

rm -rf cvs_migration
rm -rf cvs_migration_old
rm -rf cvs_migration_pascal

mkdir cvs_migration
mkdir cvs_migration_old
mkdir cvs_migration_pascal

# https://stackoverflow.com/questions/7452995/error-in-migrating-cvs-to-git

cd cvs_migration_pascal/
git clone git@github.com:lollisoft/pascal.git
git cvsimport -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot PASCAL
git branch -M main
git remote add origin git@github.com:lollisoft/pascal.git
git push -u origin main
git push origin --tags
cd ..

cd cvs_migration_old/
git clone git@github.com:lollisoft/lbdmfOldCVSBranch.git
git cvsimport -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf 
git branch -M main
git remote add origin git@github.com:lollisoft/lbdmfOldCVSBranch.git
git push -u origin main
git push origin --tags
cd ..

cd cvs_migration/
git clone git@github.com:lollisoft/lbdmf.git
git cvsimport -p "-x" -o Release_1_0_4_stable_rc1_branch -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf 
git branch -M main
git remote add origin git@github.com:lollisoft/lbdmf.git
git push -u origin main
git push origin --tags
cd ..
