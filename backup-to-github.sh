#!/bin/bash
# Pinchy's Shell - Nightly Backup Script
# Backs up workspace config and memory to GitHub

WORKSPACE="/home/mattie/.openclaw/workspace"
REPO="https://github.com/mhoying/pinchys-shell.git"

cd "$WORKSPACE" || exit 1

# Only proceed if git is initialized
if [ ! -d .git ]; then
    echo "Git not initialized in $WORKSPACE"
    exit 1
fi

# Add all changes
git add -A

# Check if there's anything to commit
if git diff-index --quiet HEAD --; then
    echo "$(date): No changes to backup" >> /tmp/pinchy-backup.log
    exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "Automated backup: $TIMESTAMP"

# Push to origin
if git push origin main 2>&1 | grep -q "error\|fatal"; then
    echo "$(date): Backup failed to push" >> /tmp/pinchy-backup.log
    exit 1
else
    echo "$(date): Backup successful" >> /tmp/pinchy-backup.log
    exit 0
fi
