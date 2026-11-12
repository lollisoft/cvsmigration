#!/bin/sh

# ==========================================
# 1. PASCAL SYNC
# ==========================================
if [ -d "cvs_migration_pascal" ]; then
    cd cvs_migration_pascal/
    
    # 1. Fetch updates (Initializes a new Git repo automatically if empty)
    git cvsimport -v -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot PASCAL
    
    # 2. Check if this is a fresh setup or an incremental run
    if ! git remote | grep -q "origin"; then
        # FIRST-TIME SETUP FLOW
        git remote add origin git@github.com:lollisoft/pascal.git
        git branch -M master main 2>/dev/null || git branch -M origin main
    else
        # INCREMENTAL RUN FLOW
        git checkout main
        # Reset to the tracking reference updated by cvsimport
        git reset --hard origin 2>/dev/null || git reset --hard master
    fi
    
    # 3. Secure Push
    git push origin main
    git push origin --tags
    cd ..
fi

# ==========================================
# 1. EdwardsIndexApp SYNC
# ==========================================
if [ -d "cvs_migration_EdwardsIndexApp" ]; then
    cd cvs_migration_EdwardsIndexApp/
    
    # 1. Fetch updates (Initializes a new Git repo automatically if empty)
    git cvsimport -v -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot EdwardsIndexApp
    
    # 2. Check if this is a fresh setup or an incremental run
    if ! git remote | grep -q "origin"; then
        # FIRST-TIME SETUP FLOW
        git remote add origin git@github.com:lollisoft/EdwardsIndexApp.git
        git branch -M master main 2>/dev/null || git branch -M origin main
    else
        # INCREMENTAL RUN FLOW
        git checkout main
        # Reset to the tracking reference updated by cvsimport
        git reset --hard origin 2>/dev/null || git reset --hard master
    fi
    
    # 3. Secure Push
    git push origin main
    git push origin --tags
    cd ..
fi

# ==========================================
# 2. LBDMF SYNC
# ==========================================
if [ -d "cvs_migration" ]; then
    cd cvs_migration/
    
    # 1. Fetch updates (Initializes a new Git repo automatically if empty)
    git cvsimport -v -p "-x" -a -d :pserver:anonymous@cvsserver.behrens.de:/home/cvsroot lbdmf
    
    # 2. Check if this is a fresh setup or an incremental run
    if ! git remote | grep -q "origin"; then
        # FIRST-TIME SETUP FLOW
        git remote add origin git@github.com:lollisoft/lbdmf.git
        
        # Create 'main_stalled' tracking branch from CVS HEAD (master/origin)
        git checkout -b main_stalled master 2>/dev/null || git checkout -b main_stalled origin
        
        # Create primary 'main' tracking branch from the stable branch
        git checkout -b main Release_1_0_4_stable_rc1_branch
    else
        # INCREMENTAL RUN FLOW
        # Sync the stalled track to CVS HEAD
        git checkout main_stalled
        git reset --hard origin 2>/dev/null || git reset --hard master
        
        # Sync the primary track to your active development branch
        git checkout main
        git reset --hard Release_1_0_4_stable_rc1_branch
    fi
    
    # 3. Explicit Push (Keeps internal tracking branches off GitHub)
    git push origin main main_stalled
    git push origin --tags

    # =======================================================
    # OPEN HUB ANALYSIS BRANCH STRIPPING INTEGRATION
    # =======================================================
    echo "Initializing Open Hub metrics isolation..."
    
    # Force delete any old local analysis branch to start fresh from current 'main'
    git branch -D openhub-analysis 2>/dev/null
    git checkout -b openhub-analysis main

    if [ -d "vendor" ]; then
        # Completely remove vendor directory tracking from the index and working tree
        git rm -rf vendor/
        git commit -m "Strip third-party vendors for accurate metric tracking"
        
        # Force-push to overwrite the analysis branch target on GitHub
        git push -f origin openhub-analysis
    else
        echo "Warning: No vendor directory detected to strip for Open Hub."
    fi

    cd ..
fi

