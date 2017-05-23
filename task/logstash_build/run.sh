#!/bin/sh

echo "ReInstalling jdk because docker image misses tools.jar"

apt-get update
apt-get install openjdk-8-jdk git -y

cd logstash_git

echo "------	  RAKING LOGSTASH	-------"
rake artifact:tar


echo "------	    RAKING DONE  	-------"

echo "------ CREATING TRANSLATE PLUGIN  ------"

cp logstash-offline-plugins-*.zip build/translate.zip

echo "------   	   TARBALLING  		-------"

rm -r build/bootstrap
tar -czf ../build_output/logstash_latest.tar.gz  build/*

ls -l ../build_output/

