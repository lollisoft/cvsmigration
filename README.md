# cvsmigration
This repo just contains my script (git-migration-init.sh for fresh initialization and git-migration-local.sh for updates from CVS to Git) how I have migrated my CVS version history with tags from two branches. The migraton was done for my main CPP project (https://github.com/lollisoft/lbdmf).

A new migration was added for my pascal stone age stuff.

# How to use the most recent version
The most recent version consists of the following two files:

full-reimport.sh        - Creating a full import by deleting the local git repo.
git-migration-engine.sh - Syncing new changes within CVS to git.

# Full Reimport
To make a full reimport, you have to clean your repo on Github or recreate the repo.
This is helpful for repetitive tests when you adapt the script to your needs.

# Git Migration Engine
The core is done by the git migration engine. Here in my case I have switched the
HEAD branch with my main developer branch as HEAD was stalled and got out of date.
The HEAD had some more integrated code generated trials and structural changes.
