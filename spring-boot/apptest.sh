#!/bin/bash

APP_NAME="HelloWorldApplication"
APP_WAR="$CI_PROJECT_DIR/target/*.war"
APP_URL="http://localhost:8080"

java -jar $APP_WAR &
APP_PID=$!

sleep 20

if curl --output /dev/null --silent --head --fail "$APP_URL"; then
  echo "Application is running"
else
  echo "Application is not running"
  exit 1
fi

kill $APP_PID
