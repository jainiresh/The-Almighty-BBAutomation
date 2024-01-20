#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 Wrong"
    exit 1
fi

ip="$1"


openssl s_client -connect "$ip":443 2>/dev/null | openssl x509 -noout -subject
