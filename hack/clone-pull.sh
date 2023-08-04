#!/bin/bash

# This script reads a text file that contains a set of github repositories to clone.
# For each repository, it checks to see if the repository has already been cloned.
# If it has already been cloned, it does a git pull to update the repository.
# If it has not been cloned, it clones the repository.
# The text file is expected to have one repository per line.
# The text file is expected to be in the same directory as the caller of this script.
# The text file is expected to be named "repos.txt".

REPOS_LIST=$(cat $PWD/repos.txt)
ROOT_DIR=$PWD

# Loop through each repository in the list
for REPO in $REPOS_LIST
do
    # Get folder name from repository url
    # Example: https://github.com/ggerganov/llama.cpp.git
    # Folder name: "llama.cpp"
    FOLDER_NAME=$(echo $REPO | rev | cut -d'/' -f1 | rev | xargs basename -s .git)
    
    # Check to see if the repository has already been cloned
    if [ -d "$PWD/$FOLDER_NAME" ]; then
        # If it has already been cloned, do a git pull to update the repository
        echo "Pulling $REPO"
        cd $FOLDER_NAME
        git pull
        cd $ROOT_DIR
    else
        # If it has not been cloned, clone the repository
        echo "Cloning $REPO"
        git clone $REPO
    fi
done
