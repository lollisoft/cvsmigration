#!/bin/sh

cd cvs_migration_pascal/
git cvsimport -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot PASCAL
git push -u origin main
git push origin --tags
cd ..

cd cvs_migration_old/
git cvsimport -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf
git push -u origin main
git push origin --tags
cd ..

cd cvs_migration/
git cvsimport -p "-x" -a -o Release_1_0_4_stable_rc1_branch -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf
git push -u origin main 
git push origin --tags
cd ..
