#!/bin/bash
set -ex

git co p
git reset --hard rm
git status
mkdir -p top_c
git subtree add -P top_c/core ../a master
git co 88dcbf35b5a
echo kk >> b
git commit -am "add b5"
git merge p
git subtree push -P top_c/core ../a t1
