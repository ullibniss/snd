#!/bin/bash

# Instalation script

function notify() {
    echo "-----------"
    echo "$1"
    echo "-----------"
}

if ! which wireshark
then
    notify "Installing wireshark"
    sudo apt install -y wireshark

fi

if ! which snd
then
    notify "Installing SND"
    USER=$(whoami)
    chown $USER:$USER ./snd.sh
    chmod 755 ./snd.sh
    cp ./snd.sh /usr/bin/snd
    mkdir /etc/snd
    cp ./lib.sh /etc/snd/lib.sh

else
    notify "You have already installed snd"
fi

notify "Please check your target host for installed tcpdump. If it has no, please install it"