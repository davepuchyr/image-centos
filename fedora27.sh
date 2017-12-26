#!/bin/bash

if [ "x${SCW_REGION}" == "x" ]; then
    echo "SCW_REGION must be set"
    exit 1
fi

wget -qO /tmp/create-image-from-http.sh https://github.com/scaleway/scaleway-cli/raw/master/examples/create-image-from-http.sh
patch /tmp/create-image-from-http.sh < ./create-image-from-http.sh.patch

cp -av /etc/ssh/*key* .

echo -e "about to \\e[36mmake image_on_local\\e[0m; just FYI, \\e[36mmake rebuild\\e[0m is subsequently an option"
time make image_on_local

