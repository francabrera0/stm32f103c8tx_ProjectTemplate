#!/bin/bash
#
# Run this script directly from the project directory

./tools/scripts/runTests.sh

mkdir -p coverage
gcovr -r ./lib . --html-details coverage/coverage.html
