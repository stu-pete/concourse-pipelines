#!/bin/sh

echo "ReInstalling jdk because docker image misses tools.jar"

apt-get update
apt-get install openjdk-8-jdk git -y

cd logstash_git

echo "------	  RAKING LOGSTASH	-------"

rake bootstrap 

echo "------	    RAKING DONE  	-------"

echo "------ INSTALLING TRANSLATE PLUGIN ------"

./bin/logstash-plugin install logstash-filter-translate
mkdir build_output

echo "------   	   TARBALLING  		-------"
mkdir LS_HOME
mkdir $LS_HOME/build


rake artifact:tar

cp -R build/* ../build_output/

ls -l ../build_output/

