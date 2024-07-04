#!/bin/bash
#
# Run this script directly from the project directory
# This scripts expects an argument with the stm32cubeclt path

if [ -z "$1" ]; then
    echo "Enter the stm32cubeclt path."
    exit 1
fi

./tools/scripts/program.sh $1 Debug

GDBSERVER="$1/STLink-gdb-server/bin/ST-LINK_gdbserver"
PROGRAMER="$1/STM32CubeProgrammer/bin"
ARMGDB="$1/GNU-tools-for-STM32/bin/arm-none-eabi-gdb"

$GDBSERVER -p 50000 -cp $PROGRAMER --swd --halt -m 0 >/dev/null &
gdbserver_pid=$!

sleep 2

$ARMGDB -ex "target remote :50000" build/Debug/app.elf
kill $gdbserver_pid


