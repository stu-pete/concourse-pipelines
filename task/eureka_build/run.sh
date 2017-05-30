#!/bin/sh
set -e -x
echo "Will build eureka now"
cd eureka_git
export TERM=${TERM:-dumb}
./gradlew clean build
cp eureka-server/build/libs/* ../eureka_build_output
tar -czf ../eureka_build_output/eureka_latest.tar.gz ../eureka_build_output/*

echo "DONE"
