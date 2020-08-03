#!/bin/bash

read -p "Service Name: " SERVICE_NAME
read -p "Git Name: " GIT_NAME
read -p "App Name: " APP_NAME

PACKAGE_NAME=${GIT_NAME//-}

cp -R template-service $GIT_NAME

sed -i "s/==GIT_NAME==/$GIT_NAME/g" pom.xml
sed -i "s/==SERVICE_NAME==/$SERVICE_NAME/g" pom.xml

cd src/main/java/com/lordgasmic
mv SERVICE $PACKAGE_NAME

cd $PACKAGE_NAME
sed -i "s/==PACKAGE_NAME==/$PACKAGE_NAME/g" Application.java
sed -i "s/==APP_NAME==/$APP_NAME/g" Application.java

mv Application.java ${APP_NAME}Application.java

# Goodbye, cruel world!
rm -- $0
