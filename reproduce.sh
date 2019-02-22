#!/bin/bash
set -ex

# build repo for subtree
mkdir sub 
pushd sub 
git init
echo is sub > sub.txt
git add sub.txt
git commit -am "init sub"
popd

# build top repo
mkdir top
pushd top
git init
echo is top > top.txt 
git add top.txt
git commit -am "init top"
popd


pushd top

# add subtree first time
git subtree add -P sub_d ../sub master

# add subtree second time
git checkout -b add_sub
git subtree add -P sub_d/core ../sub master

# someone do something in master
git checkout master
echo something >> top.txt
git commit -am "modified: top.txt, add something"

# merge subtree commit
git merge add_sub --no-edit
git branch -D add_sub
popd
