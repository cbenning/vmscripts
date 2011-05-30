#!/bin/sh
	
	
echo "Changing to /var/www/dev" cd /var/www/dev
echo "Backuping up default directory" mv cisfeaturedev/sites/default .
echo "Deleting Drupal" rm -rf cisfeaturedev
echo "Rebuilding using makefile" drush make /persist/config/makefiles/CIS.make cisfeaturedev
echo "Replacing default sites directory" rm -r cisfeaturedev/sites/default mv default cisfeaturedev/sites/
echo "Replacing CIS modules with checkout from github" rm -r cisfeaturedev/sites/all/modules/cis git clone git@github.com:geomemes/cis.git cisfeaturedev/sites/all/modules/cis
echo "Reloading MySQL database - enter MySQL root password" mysql -u root -p < cisfeaturedev/sites/default/empty_site.mysql
echo "Enabling default modules" drush -r /var/www/dev/cisfeaturedev -y en views views_ui ctools content drush -r /var/www/dev/cisfeaturedev -y en features panels imagecache imagecache_ui imageapi imageapi_imagema gick drush -r /var/www/dev/cisfeaturedev -y en admin_menu
