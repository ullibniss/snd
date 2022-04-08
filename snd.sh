#!/bin/bash

SND_DIR=/etc/snd

source "$SND_DIR/lib.sh"

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
LOGIN="$RETVAL@"

KEY='-h'
LKEY='--host'
parsearg $@
HOST=$RETVAL

KEY='-k'
LKEY='--key'
parsearg $@
RSA_KEY='-i $RETVAL'

if [[ $RSA_KEY = '-i ' ]]
then
    RSA_KEY=''
fi

KEY='-i'
LKEY='--interface'
parsearg $@
INTERFACE=$RETVAL

if [[ $INTERFACE = '' ]]
then
    INTERFACE='eth0'
fi

CONN_PATH="$LOGIN$HOST"

ssh $RSA_KEY $CONN_PATH "sudo tcpdump -U -i $INTERFACE -w - not tcp port 22" | sudo wireshark -k -i -

#     ssh -i $RSA_KEY $CONN_PATH 'sudo tcpdump -U -i eth0 -w - not tcp port 22' | sudo wireshark -k -i -
# fi
