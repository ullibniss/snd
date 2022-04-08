#!/bin/bash

function help() {
    echo "Secure Network Dump"
    echo "Usage: snd [option] [arguement]"
    echo "-----"
    echo "  -l LOGIN --login LOGIN- login for ssh connection if it needs"
    echo "  -h HOST --host HOST - host address "
    echo "  -k path/to/key --key path/to/key - path to RSA keyfile"to sniff "
    echo "  -i INTERFACE --interface INTERFACE [default=eth0] - interface you want to sniff"
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
