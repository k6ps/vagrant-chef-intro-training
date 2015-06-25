#!/bin/bash

echo === installime Tomcati ===
if sudo apt-get -yq install tomcat7 tomcat7-admin; then
   echo === Tomcat edukalt installitud ===
else
   echo === !! Ei õnnestunud Tomcati installida !! ===
   exit 1
fi
