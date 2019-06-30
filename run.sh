#!/bin/sh
cp ~/.vimrc .
git add .vimrc
git commit -m "更新"
git push origin master
