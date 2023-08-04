#!/bin/bash

# This script runs llama.cpp make, adding LLAMA_METAL=1 if the host OS is macOS on apple silicon.
# This script runs from a directory that contains llama.cpp directory.

# Check to see if the host OS is macOS on apple silicon
if [[ "$OSTYPE" == "darwin"* ]] && [[ "$(uname -m)" == "arm64" ]]; then
    # If the host OS is macOS on apple silicon, add LLAMA_METAL=1 to the make command
    echo "Running make with LLAMA_METAL=1"
    cd llama.cpp
     LLAMA_METAL=1 make
    cd ..
else
    # If the host OS is not macOS on apple silicon, run make without LLAMA_METAL=1
    echo "Running make"
    cd llama.cpp
    make
    cd ..
fi 
