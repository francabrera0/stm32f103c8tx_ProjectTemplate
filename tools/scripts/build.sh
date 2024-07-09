#!/bin/bash
#
# Run this script directly from the project directory
# This script expects an argument with the debug type defined in the CmakePresets.json

cmake --preset $1

if [ $? -eq 0 ]; then   
    cd build/$1
    make
else
    echo "Incorrect debug type."
    exit 1
fi