#!/bin/bash
#
# Run this script directly from the project directory

./tools/scripts/runTests.sh

if [ $? -ne 0 ]; then
    echo "Test failed"
    exit 1
fi

mkdir -p coverage
gcovr -r ./lib . --html-details coverage/coverage.html
