#!/bin/sh

echo "Will build eureka now"
cd eureka_git
./gradlew clean build

cp eureka-server/build/libs/* ../eureka_build_output
