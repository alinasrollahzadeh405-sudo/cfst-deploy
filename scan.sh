#!/bin/bash
    echo "Welcome to CFST Interactive!"
    read -p "Please enter max ping for IPs? (CFST will reject IPs with a higher ping than your choice): " ping
    read -p "How many IPs do you need? (How many IPs do you want CFST to test the download speed for?): " download
    read -p "Please enter the port you want to test TCP handshake of IPs? (Enter the port for TCP handshake testing; CFST will check if IPs are open on this port): " port
    echo "Starting scan..."
    ./cfst -tl ${ping} -dn ${download} -p ${port}

