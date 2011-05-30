#/bin/sh

SCRIPTS_PATH=/home/dev/geomemes/scripts/
WORKSPACE_PATH=/home/dev/workspace/
PROJ_PATH=cis
POSTGRESQL_DB_NAME=geodev
TIMESTAMP=`date '+%s'`

cd $SCRIPTS_PATH

##Drush Make
echo "----------------Drush Make-----------------"
sh install_drushmake.sh

##CIS Codebase
echo "-----------------CIS-----------------------"
if [ -d $WORKSPACE_PATH$PROJ_PATH ]; then
	echo "Found already checked out cis codebase, backing up to "$WORKSPACE_PATH$PROJ_PATH"_"$TIMESTAMP
	mv $WORKSPACE_PATH$PROJ_PATH $WORKSPACE_PATH$PROJ_PATH"_"$TIMESTAMP
fi
echo "------------Drupal and Modules-------------"
drush make CIS.make $WORKSPACE_PATH$PROJ_PATH
sh refresh_codebase.sh

##MySQL
echo "----------------MySQL----------------------"
sh init_mysql.sh

##PostGres
echo "--------------PostGreSQL-------------------"
#sh init_postgres.sh

##Drupal Settings
echo "--------------Drupal Settings--------------"
mkdir $WORKSPACE_PATH$PROJ_PATH/sites/default/files
chmod 777 $WORKSPACE_PATH$PROJ_PATH/sites/default/files
cp $SCRIPTS_PATH/settings.php $WORKSPACE_PATH$PROJ_PATH/sites/default/
chmod 755 $WORKSPACE_PATH$PROJ_PATH/sites/default/settings.php

echo -e "\nDone! Please navigate to http://localhost/cis/install.php?profile=default&locale=en\n"
