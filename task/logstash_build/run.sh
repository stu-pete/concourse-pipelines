#!/bin/sh
set -e -x
echo "ReInstalling jdk because docker image misses tools.jar"

apt-get update
apt-get install openjdk-8-jdk git -y --fix-missing

cd logstash_git

echo "------	  RAKING LOGSTASH	-------"
rake artifact:tar --trace
ls -l build/bootstrap/

echo "------	    RAKING DONE  	-------"

echo "------ CREATING TRANSLATE PLUGIN  ------"
bin/logstash-plugin install logstash-filter-translate
bin/logstash-plugin install logstash-filter-kubernetes_metadata


bin/logstash-plugin prepare-offline-pack logstash-filter-translate
mv logstash-offline-plugins-*.zip build/translate.zip

bin/logstash-plugin prepare-offline-pack logstash-filter-kubernetes_metadata
mv logstash-offline-plugins-*.zip build/kubernetes.zip



echo "------   	   TARBALLING  		-------"

rm -r build/bootstrap
tar -czf ../logstash_build_output/logstash_latest.tar.gz  build/*

ls -l ../logstash_build_output/

