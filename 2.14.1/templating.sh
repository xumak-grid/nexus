#!/bin/sh

sed -i 's/client-company-name/${CLIENT_REPOSITORY_NAME}/g' ${SONATYPE_WORK}/conf/nexus.xml