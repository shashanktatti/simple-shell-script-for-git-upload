#!/bin/bash

echo 'Taking this as your git repo :'$PWD

echo 'Add files to upload : '
read files
git add $files

echo 'Add Commit message'
read msg
git commit -m "$msg"

echo 'branch name to upload :'
read branch
git push origin $branch