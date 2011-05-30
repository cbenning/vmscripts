#!/bin/sh

REPO_URL=https://github.com/geomemes/cis
WORKSPACE_PATH=~/workspace/cis/sites/all/modules/cis

if [ -d $WORKSPACE_PATH ]
then
	echo "Codebase already exists at $WORKSPACE_PATH, attempting to merge with trunk"
	cd $WORKSPACE_PATH
	git pull
	if [ $? -eq 0 ]
	then
		echo "Performing local checkout, standby..."
		git checkout
		echo "Done."
	else
		echo "Git Pull failed, bailing out."
	fi
else
	echo "No codebase found, cloning repo to $WORKSPACE_PATH"	
	git clone $REPO_URL $WORKSPACE_PATH
	if [ $? -eq 0 ]
	then
		cd $WORKSPACE_PATH
		echo "Performing local checkout, standby..."
		git checkout
		echo "Done."
	else
		echo "Git Clone failed, bailing"
	fi

fi

