#!/bin/bash
PORT=$1

if [[ -z "$PORT" ]]; then
    echo "Must provide a port number." 1>&2
    exit 1
fi

lsof -P -i:$PORT
