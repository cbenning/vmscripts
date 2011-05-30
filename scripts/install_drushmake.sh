#!/bin/sh

DRUSH_URL=http://ftp.drupal.org/files/projects/
DRUSH_PKG=drush_make-6.x-2.2.tar.gz
DRUSH_PATH=~/.drush
TMP_PATH=tmp

if [ -d $DRUSH_PATH/drush_make ]
then
	echo "Drush make appears to aleady be installed, continuing."
else
	mkdir -p $TMP_PATH
	cd $TMP_PATH
	wget $DRUSH_URL$DRUSH_PKG
	tar xzf $DRUSH_PKG
	mv drush_make $DRUSH_PATH
	cd ..
	rm -rf $TMP_PATH
	echo "Installed in ~/.drush/drush_make"
fi
