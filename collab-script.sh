#!/bin/bash
git config --global user.email "alexsnow348@gmail.com"
git config --global user.name "alex snow"
git pull origin alex-main
git status
git add .
git commit -m "$1"
git push origin alex-main 