#!/bin/sh

script_dir=$(dirname $0)
cd $script_dir

rm -rf /tmp/_book
cp -r _book /tmp

git checkout gh-pages
git fetch
git rebase
cp -rf /tmp/_book/* .

git add .
time_stamp=`date +"%Y-%m-%d %H:%M:%S"`
git commit -m "Document updated: $time_stamp"
git push origin gh-pages

git checkout master
if [[ "$stash_result" != "No local changes to save" ]]; then
    git stash pop
fi

echo "gitbook push finish"
