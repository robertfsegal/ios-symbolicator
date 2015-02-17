#!/bin/sh


BUNDLE="$1"
ARCH="$2"
BASE_ADDRESS="$3"
FUNC_ADDRESS="$4"

xcrun atos -o "$BUNDLE.app"/"$BUNDLE" -arch $ARCH -l $BASE_ADDRESS $FUNC_ADDRESS


