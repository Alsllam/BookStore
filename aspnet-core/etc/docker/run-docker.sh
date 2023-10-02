#!/bin/bash

if [[ ! -d certs ]]
then
    mkdir certs
    cd certs/
    if [[ ! -f localhost.pfx ]]
    then
        dotnet dev-certs https -v -ep localhost.pfx -p 337ed5b9-91bf-48a9-9bd1-374f80f2010e -t
    fi
    cd ../
fi

docker-compose up -d
