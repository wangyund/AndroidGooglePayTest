#!/bin/bash

#  0. 初始化环境变量

pwd=$PWD

export rootPwd=${pwd}
android=$PWD/android
mkdir -p ${android}
chmod +x ${pwd}/code
echo "目录结构如下所示："
ls -l

#  1. 生成签名证书
chmod +x ${pwd}/scripts/00_cert.sh
${pwd}/scripts/00_cert.sh

#  2. SDK构建

## 2.1 SDK代码混淆以及变量替换

chmod +x ${pwd}/scripts/01_quicksdk_resource.sh
${pwd}/scripts/01_quicksdk_resource.sh

# 变量替换
chmod +x ${pwd}/scripts/03_replace_sdk.sh
${pwd}/scripts/03_replace_sdk.sh

# 混淆代码
${pwd}/code sdk start



## 2.2 构建SDK aar包

# 初始化文件时间
cp -r SDK SDK_BAK
rm -rf SDK
mv SDK_BAK SDK

# 删除app代码
rm -rf ./SDK/app




cd SDK
rm -rf ./local.properties
chmod +x gradlew
./gradlew assembleRelease
. ${rootPwd}/config.ini &> /dev/null
echo "生成aar文件"
ls ${pwd}/SDK/${sdk_name}/build/outputs/aar/*
cd ${pwd}
## 2.3 混淆SDK aar包（未完成）



#  3. apk包构建

echo "3. apk包构建"

# 初始化文件时间
cp -r GAME GAME_BAK
rm -rf GAME
mv GAME_BAK GAME

## 3.1 GAME代码混淆以及变量替换

# 修改build.gradle
chmod +x ${rootPwd}/scripts/05_fix_gradle.sh
${rootPwd}/scripts/05_fix_gradle.sh

chmod +x ${pwd}/scripts/01_fix_manifest.sh
${pwd}/scripts/01_fix_manifest.sh

# 混淆代码
${pwd}/code game start

cat ${pwd}/GAME/app/build.properties

# copy依赖库
cp ${pwd}/SDK/${sdk_name}/build/outputs/aar/* ${pwd}/GAME/app/libs/


#  4. 处理obb

cd ${rootPwd}

chmod +x ${rootPwd}/scripts/04_fix_obb.sh
${rootPwd}/scripts/04_fix_obb.sh

rm -rf ${rootPwd}/GAME/app/game.obb

## 5. 处理xinchuan.shuma
chmod +x ${rootPwd}/scripts/06_fix_dir.sh
${rootPwd}/scripts/06_fix_dir.sh


cd ${pwd}/GAME
# 清理
rm -rf ${rootPwd}/GAME/app/libs/Xctech*
rm -rf ${rootPwd}/GAME/local.properties

cp ${rootPwd}/SDK/gradlew ./
cp -r ${rootPwd}/SDK/gradle ./
#开始打包
./gradlew assembleRelease

# 打包后的处理
chmod +x ${rootPwd}/scripts/07_final_deal.sh
${rootPwd}/scripts/07_final_deal.sh



