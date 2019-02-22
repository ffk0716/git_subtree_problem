#!/bin/bash
set -ex

pushd top
# cleanup
git checkout master
git branch -D new_master || true
git branch -D add_sub || true
git branch -D other || true

# remove add add subtree again
git checkout -b add_sub master
rm -fr sub_d/core
git commit -am "remove core for re-sync"
mkdir -p sub_d2
git subtree add -P sub_d2/core ../sub master
git subtree push -P sub_d2/core ../sub try_fix1_add_sub


# someone do something in master
git co -b other master
echo something2 >> top.txt
git commit -am "modified: top.txt, add something2"

# merge new subtree branch first
git co -b new_master master
git merge add_sub --no-edit
# subtree pushback
git subtree push -P sub_d2/core ../sub try_fix1_merge_add_sub

# merge other branch
git merge other --no-edit
# subtree pushback
git subtree push -P sub_d2/core ../sub try_fix1_merge_other

popd
