#!/bin/bash


cd ${rootPwd}/tool_output/

java -jar AndResGuard-cli-1.2.15.jar ${rootPwd}/app/build/outputs/apk/release/app-release.apk -config config.xml -out ${rootPwd}/app/build/outputs/apk/release/output
