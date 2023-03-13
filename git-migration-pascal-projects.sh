#!/bin/sh

mkdir cvs_migration_pascal

cd cvs_migration_pascal/
git cvsimport -v -d :pserver:lothar@localhost:/home/cvsroot PASCAL
git remote add origin git@github.com:lollisoft/pascal.git
git branch -M master
git push -u origin master
git push origin --tags
cd ..
