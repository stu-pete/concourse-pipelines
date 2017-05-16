#!/bin/sh

echo "ReInstalling jdk because docker image misses tools.jar"

apt-get update
apt-get install openjdk-8-jdk -y

cd logstash_git

echo "------	  RAKING LOGSTASH	-------"

rake bootstrap --trace

echo "------	    RAKING DONE  	-------"

echo "------ INSTALLING TRANSLATE PLUGIN ------"

./bin/logstash-plugin install logstash-filter-translate
mkdir build_output

echo "------   	   TARBALLING  		-------"

tar -vczf ../build_output/logstash_latest.tar.gz bin


