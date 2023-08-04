#!/bin/bash

# Use a boolean to enable linking
ENABLE_LINKING=true
ROOT_DIR=$PWD
MODELS_DIR=$PWD/models
LLAMA_CPP_MODELS_DIR=$PWD/llama.cpp/models

# see if git-lfs is installed
if ! command -v git-lfs &> /dev/null
then
    echo "git-lfs could not be found"
    echo "Please install git-lfs and try again"
    exit
fi

# This script reads a models.txt file from the caller directory.
# For each line, the script will look for the $FOLDER_NAME directory.
# If the directory exists, it will cd into the directory and git pull.

MODELS_LIST=$(cat $PWD/models.txt)
cd $MODELS_DIR

# extract FOLDER NAME and MODEL NAME From each line in MODELS_LIST
# $FOLDER_NAME/$MODEL_NAME
for LINE in $MODELS_LIST
do 
    FOLDER_NAME=$(echo $LINE | awk -F/ '{print $1}')
    MODEL_NAME=$(echo $LINE | awk -F/ '{print $2}')
    echo "FOLDER_NAME: $FOLDER_NAME"
    echo "MODEL_NAME: $MODEL_NAME"
    
    cd $FOLDER_NAME
    
    git lfs pull -I "$MODEL_NAME"

    if [ "$ENABLE_LINKING" = true ] ; then
        # if link does not exist, create it
        if [ ! -L "$LLAMA_CPP_MODELS_DIR/$MODEL_NAME" ]; then
            echo "Creating link: $LLAMA_CPP_MODELS_DIR/$MODEL_NAME"
            ln $PWD/$MODEL_NAME $LLAMA_CPP_MODELS_DIR/$MODEL_NAME
        fi
    fi
    cd $MODELS_DIR
done


cd $ROOT_DIR