#!/bin/bash
#
# Run this script directly from the project directory

echo "Building app..."
./tools/scripts/build.sh Test

cd build/Test
make test