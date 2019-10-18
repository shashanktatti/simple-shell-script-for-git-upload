#!/bin/bash

echo 'Taking this as your git repo :'$PWD


check_upstream=$(git config --get remote.upstream.url)

if [ "$check_upstream" == 0 ]
    echo "Upstream not available!"
    echo "Enter Parent Repo URL: "
    read upstream_url
    git remote add upstream $upstream_url

    echo "Enter branch name of upstream : "
    read branch
    git fetch upstream $branch

    echo "1. Merge , 2. Rebase \n Enter 1 or 2"
    read option

    if [ "$option" == 1 ]
    then
        git rebase upstream/$branch
    fi

    if [ "$option" == 2 ]
    then
        git merge upstream/$branch
    fi
fi