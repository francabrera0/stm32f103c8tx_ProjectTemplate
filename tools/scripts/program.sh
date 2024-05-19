#!/bin/bash
#
# Run this script directly from the project directory
# This scripts expects an argument with the stm32cubeclt path

if [ -z "$1" ]; then
    echo "Enter the stm32cubeclt path."
    exit 1
fi

PROGRAMER="$1/STM32CubeProgrammer/bin/STM32_Programmer_CLI"

$PROGRAMER --connect port=swd --write build/Debug/app.elf -rst 

