rm -rf /tmp/_book
cp -r ./_book /tmp

git add .
git stash

git checkout gh-pages
rm -rf ./*
mv -r /tmp/_book/* .

git add .
time_stamp=`date +"%Y-%m-%d %H:%M:%S"`
git commit -m "Document updated: $time_stamp"
git push origin gh-pages

git checkout master
git stash pop
