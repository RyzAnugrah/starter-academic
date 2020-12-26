#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Genterate file statis
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# pindah ke direktori publik
cd public
# tambahkan perubahan ke Git
git add .

# Buat sebuah commit baru
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push atau upload ke Github
git push origin main

# Balik ke direktori sebelumnya
cd ..
