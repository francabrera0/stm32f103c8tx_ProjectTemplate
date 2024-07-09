#!/bin/bash
#
# Run this script directly from the project directory
# This scripts expects an argument with the stm32cubeclt path and the debug type defined in the CmakePresets.json

if [ -z "$1" ]; then
    echo "Enter the stm32cubeclt path."
    exit 1
fi

if [ -z "$2" ]; then
    echo "Enter the debug type."
    exit 1
fi

if [ "$2" == "Test" ]; then
    echo "Compile for Debug or Release target"
    exit 1
fi

echo "Building app..."
./tools/scripts/build.sh $2

if [ $? -ne 0 ]; then
    exit 1
fi

PROGRAMER="$1/STM32CubeProgrammer/bin/STM32_Programmer_CLI"

$PROGRAMER --connect port=swd --write "build/$2/app.elf" -rst 

