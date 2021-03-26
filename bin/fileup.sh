#!/bin/bash
#
# Copyright © 2020-2021, Samar Vispute "SamarV-121" <samarvispute121@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#
# --
# Options
# --0x0         | -0   https://0x0.st
# --bayfiles    | -b   https://bayfiles.com
# --bashupload  | -ba  https://bashupload.com
# --filepush    | -f   https://filepush.co
# --keep        | -k   https://keep.sh
# --gofile      | -g   https://gofile.io
# --github      | -gh  https://github.com
# --transfer    | -t   https://transfer.sh
# --sourceforge | -s   https://sourceforge.net
#

FILE="$2"

case $1 in
--0x0 | -0)
	curl -F "file=@$FILE" https://0x0.st | tee /dev/null
	;;
--bayfiles | -b)
	curl -F "file=@$FILE" https://api.bayfiles.com/upload | cut -d'"' -f12
	;;
--bashupload | -ba)
	curl bashupload.com -T "$FILE"
	;;
--filepush | -f)
	curl --upload-file "$FILE" "https://filepush.co/upload/$FILE" | tee /dev/null
	;;
--gofile | -g)
	SERVER=$(curl -s -m 15 https://apiv2.gofile.io/getServer | cut -d'"' -f10)
	LINK=$(curl -F "file=@$FILE" "https://$SERVER.gofile.io/uploadFile" | cut -d'"' -f10)
	echo "https://gofile.io/d/$LINK"
	;;
--github | -gh)
    # https://github.com/SamarV-121/dotfiles/blob/master/bin/github-release.sh
	github-release.sh "SamarV-121/mirror" "$(date -u +%Y%m%d_%H%M%S)" "master" "Date: $(env TZ="$timezone" date)" "$FILE"
	;;
--keep | -k)
	curl --upload-file "$FILE" https://free.keep.sh | tee /dev/null
	;;
--sourceforge | -s)
	grep frs.sourceforge.net ~/.ssh/known_hosts >/dev/null || ssh-keyscan frs.sourceforge.net >> "$HOME/.ssh/known_hosts"
	sshpass -p "$SF_PASS" rsync -avP -e ssh "$FILE" samarv-121@frs.sourceforge.net:/home/frs/project/samarv-121/mirror &&
	echo "https://sourceforge.net/projects/samarv-121/files/mirror/$(basename "$FILE")"
	;;
--transfer | -t)
	curl --upload-file "$FILE" "http://transfer.sh/$FILE" | tee /dev/null
	;;
	*)
	sed -n '/^$/q;/# --/,$ s/^#*//p' "$0"
esac
