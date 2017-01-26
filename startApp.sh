#!/bin/sh

export APP_RUNTIME_LOG="/var/tmp/code_deploy_run_my_app.log"
/bin/rm -f $APP_RUNTIME_LOG
 
export NODE_ENV=production
export DB_PRD_HOST=spidertutorial-postgresql.cvfirauwtcfx.us-west-2.rds.amazonaws.com
export DB_PRD_USER=spidertutorial
export DB_PRD_PASS=spidertutorial
export NODE_HOST=localhost
export NODE_PORT=8080

echo "\nRUNNING_AS:\n `id`" | tee $APP_RUNTIME_LOG
echo "\nKILLING existing App process if running: " | tee -a $APP_RUNTIME_LOG
pgrep -f "node /myapp/index.js" | tee -a $APP_RUNTIME_LOG
pkill -f "node /myapp/index.js"

echo "\nAPP_VARS:" | tee -a $APP_RUNTIME_LOG
echo " NODE_ENV: $NODE_ENV" | tee -a $APP_RUNTIME_LOG
echo " DB_PRD_HOST: $DB_PRD_HOST" | tee -a $APP_RUNTIME_LOG
echo " DB_PRD_USER: $DB_PRD_USER" | tee -a $APP_RUNTIME_LOG
echo " DB_PRD_PASS: $DB_PRD_PASS" | tee -a $APP_RUNTIME_LOG
echo " NODE_HOST: $NODE_HOST" | tee -a $APP_RUNTIME_LOG
echo " NODE_PORT: $NODE_PORT" | tee -a $APP_RUNTIME_LOG

echo "\nStarting NodeJS app on `uname -n`:" | tee -a $APP_RUNTIME_LOG
echo "\nConnect to this to test it:" | tee -a $APP_RUNTIME_LOG
my_ip=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4`
echo "http://${my_ip}:${NODE_PORT}/products/120" | tee -a $APP_RUNTIME_LOG

node /myapp/index.js &
exit 0
