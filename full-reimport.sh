#!/bin/sh

echo "=== WIPING OLD LOCAL WORKSPACES ==="
rm -rf cvs_migration
rm -rf cvs_migration_old
rm -rf cvs_migration_pascal
rm -rf cvs_migration_EdwardsIndexApp

echo "=== CREATING PRISTINE DIRECTORIES ==="
mkdir cvs_migration
mkdir cvs_migration_old
mkdir cvs_migration_pascal
mkdir cvs_migration_EdwardsIndexApp

echo "=== EXECUTING INITIAL FULL IMPORT VIA ENGINE ==="
./git-migration-engine.sh

echo "=== FULL CLEAN MIGRATION COMPLETE ==="

