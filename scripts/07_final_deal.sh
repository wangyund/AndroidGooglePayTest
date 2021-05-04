#!/bin/bash



#. ${rootPwd}/config.ini &> /dev/null

#cd ${rootPwd}/GAME/app/build/outputs/apk/release/
#apktool d ${cp_apk_name}.apk

#rm -rf ./${cp_apk_name}/assets/supplierconfig.json
#apktool b  ${cp_apk_name}

#. ${rootPwd}/config.ini &> /dev/null
cd ${rootPwd}/tool_output/
#java -jar AndResGuard-cli-1.2.15.jar ${rootPwd}/GAME/app/build/outputs/apk/release/${cp_apk_name}/dist/${cp_apk_name}.apk -config config.xml -out ${rootPwd}/GAME/app/build/outputs/apk/release/output



java -jar AndResGuard-cli-1.2.15.jar ${rootPwd}/app/build/outputs/apk/release/app-release.apk -config config.xml -out ${rootPwd}/app/build/outputs/apk/release/output
