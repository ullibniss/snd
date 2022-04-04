#!/bin/bash

function help() {
    echo "Secure Network Dump"
    echo "Usage: snd [option] [arguement]"
    echo "-----"
    echo "  -l --login - login for ssh connection if it needs"
    echo "  -h --host - host address "
    echo "  -k --key - path to RSA keyfile"
}

KEY=""
LKEY=""
function parsearg() {

    RETVAL=""
    local check=0
    local i=""
    for i
    do  

        if [[ $check == 1 ]]
        then
            RETVAL=$i
            check=0
            break
        fi
        if [[ $i == $KEY ]] || [[ $i == $LKEY ]]
        then
            check=1
        fi
    done

}

if (( $# == 0 ))
then
    help
    exit
else
    for ARG
    do
        if [[ $ARG == "--help" ]]
        then
            help
            exit
        fi
    done
fi


KEY='-l'
LKEY='--login'
parsearg $@
LOGIN=$RETVAL

KEY='-h'
LKEY='--host'
parsearg $@
HOST=$RETVAL

KEY='-k'
LKEY='--key'
parsearg $@
RSA_KEY=$RETVAL

echo "$LOGIN@$HOST"
echo "$RSA_KEY"