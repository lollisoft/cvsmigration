#!/bin/sh

mkdir cvs_migration
mkdir cvs_migration_old

cd cvs_migration/
git cvsimport -v -o Release_1_0_4_stable_rc1_branch -d :pserver:anonymous@lbdmf.cvs.sourceforge.net:/cvsroot/lbdmf CPP
git remote add origin git@github.com:lollisoft/lbdmf.git
git branch -M master
git push -u origin master
git push origin --tags
cd ..

cd cvs_migration_old/
git cvsimport -v -d :pserver:anonymous@lbdmf.cvs.sourceforge.net:/cvsroot/lbdmf CPP
git remote add origin git@github.com:lollisoft/lbdmf.git
git branch -M old
git push -u origin old
git push origin --tags
cd ..
