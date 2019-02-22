#!/bin/bash
set -ex

pushd top
# cleanup
git checkout master
git branch -D dummy_master add_sub || true

# remove add add subtree again with new name
git checkout -b add_sub master
rm -fr sub_d/core
git commit -am "remove core for re-sync"
git subtree add -P sub_d/core2 ../sub master

# someone do something in master
git co -b dummy_master master
echo something2 >> top.txt
git commit -am "modified: top.txt, add something2"
git merge add_sub --no-edit

# subtree pushback
git subtree push -P sub_d/core2 ../sub try_fix2
popd
