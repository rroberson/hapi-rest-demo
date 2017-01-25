#!/bin/sh
export APP_RUNTIME_LOG="/var/tmp/code_deploy_run_my_app.log"

export NODE_ENV=production
export DB_PRD_HOST=spidertutorial-postgresql.cvfirauwtcfx.us-west-2.rds.amazonaws.com
export DB_PRD_USER=spidertutorial
export DB_PRD_PASS=spidertutorial
export NODE_HOST=localhost
export NODE_PORT=8080

echo -e "\nRUNNING_AS:\n `id`" | tee $APP_RUNTIME_LOG
echo -e "\nAPP_VARS:" | tee -a $APP_RUNTIME_LOG
echo " NODE_ENV: $NODE_ENV" | tee -a $APP_RUNTIME_LOG
echo " DB_PRD_HOST: $DB_PRD_HOST" | tee -a $APP_RUNTIME_LOG
echo " DB_PRD_USER: $DB_PRD_USER" | tee -a $APP_RUNTIME_LOG
echo " DB_PRD_PASS: $DB_PRD_PASS" | tee -a $APP_RUNTIME_LOG
echo " NODE_HOST: $NODE_HOST" | tee -a $APP_RUNTIME_LOG
echo " NODE_PORT: $NODE_PORT" | tee -a $APP_RUNTIME_LOG

echo -e "\nStarting NodeJS app on `uname -n`:" | tee -a $APP_RUNTIME_LOG
echo -e "\nConnect to this to test it:" | tee -a $APP_RUNTIME_LOG
my_ip=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
echo "http://${my_ip}:${NODE_PORT}/products/120" | tee -a $APP_RUNTIME_LOG

node /myapp/index.js &
exit 0
