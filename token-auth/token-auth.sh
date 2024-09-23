#!/bin/bash
 
DATADIR="./data"
USERS="u1 u2 u3"
TOKEN_FILE="${DATADIR}/token.csv"
GROUP="dev"
 
mkdir -p data
 
if [ ! -f ${TOKEN_FILE} ]; then
        for U in ${USERS}
        do
                echo "$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64 | tr -d "=+/" | dd bs=32 count=1 2>/dev/null),${U},${U}_id,${GROUP}" >> ${TOKEN_FILE}
        done
fi
 
echo "\n "
#cp ${TOKEN_FILE} ../2_authenticate/data
#cp ${TOKEN_FILE} ../3_authorize_user/data
cat ${TOKEN_FILE}
echo "\n "