#!/bin/bash

QTBIN="$(pwd)/ext/qt6/install/bin"

echo "Append QT binary directory to PATH : $QTBIN"
export PATH=$PATH:$QTBIN

echo "PATH : $PATH"

