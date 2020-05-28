rm -rf /tmp/_book
cp -r _book /tmp

git add .
stash_result=`git stash`

git checkout gh-pages
# rm -rf ./*
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
