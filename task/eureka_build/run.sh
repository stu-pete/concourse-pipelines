#!/bin/sh

echo "Will build eureka now"
mkdir build_output/eureka
cd eureka_git
gradle clean build

cp eureka-server/build/libs/* ../eureka_build_output
