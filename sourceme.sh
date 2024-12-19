#!/bin/bash

SCRIPT=$(readlink -f $BASH_SOURCE)
BASEDIR=$(dirname $SCRIPT)

QTPATH=$BASEDIR/tools/qt6/bin
echo "Append path to QT : $QTPATH"
export PATH=$PATH:$QTPATH

echo "Final PATH : $PATH"

