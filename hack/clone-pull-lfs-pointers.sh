#!/bin/bash

# From the caller directory, if directory "models" does not exist, create it.
# This script reads a text file that contains a set of github repositories to clone.
# For each repository, it checks to see if the repository has already been cloned.
# If it has already been cloned, it does a git pull to update the repository.
# If it has not been cloned, it clones the repository.
# The text file is expected to have one repository per line.
# The text file is expected to be in the same directory as the caller of this script.
# The text file is expected to be named "lfs-repos.txt".

# see if git-lfs is installed
if ! command -v git-lfs &> /dev/null
then
    echo "git-lfs could not be found"
    echo "Please install git-lfs and try again"
    exit
fi

REPOS_LIST=$(cat $PWD/lfs-repos.txt)

[ ! -d "$PWD/models" ] && mkdir $PWD/models
cd $PWD/models

# Loop through each repository in the list
for REPO in $REPOS_LIST
do
    # Get folder name from repository url
    # Example: https://huggingface.co/TheBloke/airoboros-l2-13b-gpt4-m2.0-GGML
    # Folder name: airoboros-l2-13b-gpt4-m2.0-GGML
    FOLDER_NAME=$(echo $REPO | awk -F/ '{print $NF}')
        
    # Check to see if the repository has already been cloned
    if [ -d "$PWD/$FOLDER_NAME" ]; then
        # If it has already been cloned, do a git pull to update the repository
        echo "Pulling $REPO"
        cd $PWD/$FOLDER_NAME
        git pull
        cd ..
    else
        # If it has not been cloned, clone the repository
        echo "Cloning $REPO"
        GIT_LFS_SKIP_SMUDGE=1 git clone $REPO
    fi
done

cd ..