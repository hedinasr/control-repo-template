#!/bin/sh
#
# Create a symlink to the module in parameter (if
# the module exists in control/modules subdirectory)
#
# Usage: ./create-module-symlink <module_name>

if [ -e control/modules/"$1" ]
then
    ln -n -s control/modules/"$1" "$1"
else
    echo "module $1 does not exists!"
fi
