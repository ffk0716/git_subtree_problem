set -ex

mkdir sub 
pushd sub 
git init
echo is sub > sub.txt
git add sub.txt
git commit -am "init sub"
popd

mkdir top
pushd top
git init
echo is top > top.txt 
git add top.txt
git commit -am "init top"
popd

