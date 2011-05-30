
MYSQL_DB_NAME=geodev
MYSQL_USER_NAME=geodev
MYSQL_USER_PASSWD=geomemes

stty -echo 
read -p "Enter MySQL root password:" PASSWD
stty echo 
EXISTS=`mysql -u root -p$PASSWD -e "SHOW DATABASES;" | grep $MYSQL_DB_NAME`
if [ "$EXISTS" == "$MYSQL_DB_NAME" ]; then
	echo -e "\nDatabase $MYSQL_DB_NAME already exists, skipping creation\n"
else
	mysql -u root -p$PASSWD -e "CREATE DATABASE $MYSQL_DB_NAME;"
	mysql -u root -p$PASSWD -e "CREATE USER '$MYSQL_USER_NAME'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWD';"
	mysql -u root -p$PASSWD -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP ON $MYSQL_DB_NAME.* TO '$MYSQL_USER_NAME'@'localhost';"
fi

#echo "Enabling default modules" drush -r /var/www/dev/cisfeaturedev -y en views views_ui ctools content drush -r /var/www/dev/cisfeaturedev -y en features panels imagecache imagecache_ui imageapi imageapi_imagema gick drush -r /var/www/dev/cisfeaturedev -y en admin_menu

