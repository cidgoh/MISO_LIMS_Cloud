#!/usr/bin/env bash

mkdir miso-lims-compose
wget https://github.com/miso-lims/miso-lims/archive/master.zip
unzip master.zip 'miso-lims-master/.docker/*'
mv miso-lims-master/.docker/* miso-lims-compose
rm -fr master.zip miso-lims-master/
cd miso-lims-compose
export MISO_DB_USER=tgaclims && export MISO_DB=lims && export MISO_DB_PASSWORD_FILE=./.miso_db_password && export MISO_TAG=latest
echo "test_pass" > ./.miso_db_password
mkdir -p ./database
sed '/flyway:/i \ \ \ \ volumes:\n\ \ \ \ \ \ - ./database:/var/lib/mysql' demo.detailed.yml > miso.detailed.yml
docker-compose -f miso.detailed.yml up -d
