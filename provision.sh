#!/bin/bash

echo === installime Tomcati ===
if sudo apt-get -yq install tomcat7 tomcat7-admin; then
   echo === Tomcat edukalt installitud ===
else
   echo === !! Ei õnnestunud Tomcati installida !! ===
   exit 1
fi

echo === konfime Tomcati admin kasutaja ===
if sudo cp /vagrant/tomcat-users.xml.template /etc/tomcat7/tomcat-users.xml && sudo service tomcat7 restart; then
   echo === Tomcati admin kasutaja edukalt konfitud ===
else
   echo === !! Ei õnnestunud Tomcati admin kasutajat konfida !! ===
   exit 1
fi
