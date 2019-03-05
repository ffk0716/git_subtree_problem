#!/bin/bash
set -ex

pushd top

git subtree push -P sub_d/core ../sub step2_fail_to_push

popd
