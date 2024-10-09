#!/bin/zsh
ELF_NAME=$1
BINARY_NAME=${1:r}.bin
SYSEX_NAME=${1:r}.syx

arm-none-eabi-objcopy -O binary $ELF_NAME $BINARY_NAME

docker run -v${PWD}/target:/target \
    firmware-sender /FirmwareSender/Builds/Linux/build/FirmwareSender \
    -in $BINARY_NAME \
    -save $SYSEX_NAME \
    -run