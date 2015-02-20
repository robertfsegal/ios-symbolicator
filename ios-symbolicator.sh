#!/bin/sh


BUNDLE="$1"
CRASH_FILE="$2"
FUNC_ADDRESS="$3"

line_number=$(grep -n "Binary Images" ${CRASH_FILE} | tr "Binary Images" " " | tr ":" " ")
line_number=$((${line_number// }+1))

ARCH=$(head -n ${line_number} ${CRASH_FILE} | tail -n 1 | tr " " "\n" | grep "arm")
BASE_ADDRESS=$(head -n ${line_number} ${CRASH_FILE} | tail -n 1 | tr " " "\n" | head -n 1)

echo "Architecture detected as - $ARCH"
echo "Base address detected as - $BASE_ADDRESS"
echo "Looking for function at address $FUNC_ADDRESS..."

xcrun atos -o "$BUNDLE.app"/"$BUNDLE" -arch $ARCH -l $BASE_ADDRESS $FUNC_ADDRESS

echo "Done."


