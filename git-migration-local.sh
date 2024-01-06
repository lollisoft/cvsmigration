#!/bin/sh

#rm -rf cvs_migration
#rm -rf cvs_migration_old

#mkdir cvs_migration
#mkdir cvs_migration_old


cd cvs_migration_old/
git cvsimport -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf
#git remote add origin git@github.com:lollisoft/lbdmf_oldCVSBranch.git
#git branch -M old
git push -u origin old
git push origin --tags
cd ..

cd cvs_migration/
git cvsimport -o Release_1_0_4_stable_rc1_branch -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf
#git remote add origin git@github.com:lollisoft/lbdmf.git
#git branch -M master
git push -u origin master
git push origin --tags
cd ..
