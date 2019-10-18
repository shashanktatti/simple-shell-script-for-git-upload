#!/bin/bash

echo 'Taking this as your git repo :'$PWD

echo 'Checking for changes :'
repo_changed=$(git diff)

if [ "$repo_changed" == 0 ]
then
	echo "First change something to upload!"
	.
else
	echo 'Add files to upload : '
	read files
	git add $files

	echo 'Add Commit message'
	read msg
	git commit -m "$msg"
	
	check_origin=$(git config --get remote.origin.url)
	if [ "$check_origin" == 0 ]
	then
		echo "Origin is not set. So setting it"
		echo "Enter Repo URL : "
		read repo_url
		git remote add origin $repo_url
		.
	fi
	echo 'branch name to upload :'
	read branch
	git push origin $branch
fi
