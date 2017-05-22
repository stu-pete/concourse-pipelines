#!/bin/sh

echo "ReInstalling jdk because docker image misses tools.jar"

apt-get update
apt-get install openjdk-8-jdk -y

cd logstash_git

echo "------	  RAKING LOGSTASH	-------"

rake bootstrap 

echo "------	    RAKING DONE  	-------"

echo "------ INSTALLING TRANSLATE PLUGIN ------"

./bin/logstash-plugin install logstash-filter-translate
mkdir build_output

echo "------   	   TARBALLING  		-------"
mkdir LS_HOME
export LS_HOME=LS_HOME
mkdir $LS_HOME/build
rake artifact:tar
cp -R LS_HOME/build/* ../build_output/
rake artifact:tar
tar -vczf ../build_output/logstash_latest.tar.gz bin


