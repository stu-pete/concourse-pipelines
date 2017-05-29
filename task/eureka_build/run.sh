#!/bin/sh

echo "Will build eureka now"
cd eureka_git
export TERM=${TERM:-dumb}
./gradlew clean build

cp eureka-server/build/libs/* ../eureka_build_output
