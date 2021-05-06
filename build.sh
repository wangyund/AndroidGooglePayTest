#!/bin/bash

pwd=$PWD

export rootPwd=${pwd}
android=$PWD/android
mkdir -p ${android}
chmod +x ${pwd}
echo "目录结构如下所示："
ls -l

## 2.1 SDK代码混淆以及变量替换
cd ${pwd}

#开始打包
./gradlew assembleRelease

# 打包后的处理
#chmod +x ${rootPwd}/scripts/07_final_deal.sh
#${rootPwd}/scripts/07_final_deal.sh



