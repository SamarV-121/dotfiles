#!/bin/bash
#
# Copyright © 2020-2021, Samar Vispute "SamarV-121" <samarvispute121@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#

for URL in "${@:2}"; do

URL=$(echo "$URL" | sed -e 's|#.*||' -e 's|.patch||')
PATCH=$(curl -s "$URL.patch")
commit_msg=$(echo "$PATCH" | sed -n '/PATCH/,/---/p' | sed -e 's/.*] //' -e '$ d')
date=$(echo "$PATCH" | grep 'Date: ' | sed 's/Date: //')
author=$(echo "$PATCH" | grep 'From: ' | sed 's/From: //')
_repo=$(sed -e 's/\/tree.*//' -e 's/\/commit.*//' <<< "$URL")
_path=$(sed -e 's/.*proprietary_//' -e 's/.*android//' -e 's/_/\//' <<< "$_repo")
branch=$(cut -d '/' -f7 <<< "$URL")

case $1 in
-am)
	echo "$PATCH" | git am -3 --keep-cr
	;;
-p)
	echo "$PATCH" | patch -p1
	;;
-c)
	git commit --am -m "$commit_msg" --date "$date" --author "$author"
	;;
clone)
	git clone "$_repo" -b "$branch" "$_path"
	;;
fetch)
	git fetch "$_repo" "$branch"
	;;
-h | --help)
	echo $'Option  Meaning\n-am     Patch using `git am`\n-p      Patch using `patch -p1`\n-k      Append commit_msg, date, author to last commit'
	;;
*)
	echo Missing URL
	;;
esac
done
