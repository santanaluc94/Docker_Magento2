#!/usr/bin/env bash
rm -rf var/di/
rm -rf var/generation/
rm -rf var/cache/
rm -rf pub/static/_requirejs/
rm -rf pub/static/frontend/
rm -rf var/view_preprocessed/
rm -rf var/page_cache/
rm -rf generated/
bin/magento maintenance:enable
# bin/magento app:config:import
bin/magento setup:upgrade
# bin/magento indexer:reindex
bin/magento setup:di:compile
bin/magento setup:static-content:deploy pt_BR en_US -f
bin/magento maintenance:disable
bin/magento cache:clean
bin/magento cache:flush
# chmod 777 var/ -R
# chmod 777 pub/ -R
# chmod 777 generated/ -R
chmod 777 -R *