#!/bin/sh
echo "yay no_proxy"

echo "Installing jdk because docker image misses tools.jar"
apt-get update
apt-get install openjdk-8-jdk -y

cd logstash_git
rake bootstrap
./bin/logstash-plugin install logstash-filter-translate
mkdir build_output

tar -vczf build_output/logstash_latest.tar.gz bin

