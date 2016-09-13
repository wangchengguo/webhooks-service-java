#!/bin/bash

GIT_PATH=/data/service-jar
DEPLOY_PATH=/home/app/service-jar
JAR_VERSION=-0.0.1-SNAPSHOT
taskName=bargain
path=./projects/dr2/${taskName}/target/${taskName}${JAR_VERSION}.jar
echo $path
bootsh=/home/app/agent-sh

echo "开始拉取服务"
cd $GIT_PATH
echo "拉取代码中..."
git reset --hard origin/master
git clean -f
git pull
git checkout test
echo "拉取完成!!!"
echo "开始打包..."
gulp --buildtype debug
echo "打包完成!!!"
echo "开始拷贝"
cp -r ${path} ${DEPLOY_PATH}
echo "拷贝完成!!!"

# cd $bootsh
# echo "启动所有服务中..."
# ./all.sh restart
# echo "服务已启动!!!"


