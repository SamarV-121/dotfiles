#!/bin/bash
#
# Copyright © 2020-2021, Samar Vispute "SamarV-121" <samarvispute121@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#

FILE="$2"

case $1 in
--0x0 | -0)
	curl -F "file=@$FILE" https://0x0.st | tee /dev/null
	;;
--bayfiles | -b)
	curl -F "file=@$FILE" https://api.bayfiles.com/upload | cut -d'"' -f12
	;;
--filepush | -f)
	curl --upload-file "$FILE" "https://filepush.co/upload/$FILE" | tee /dev/null
	;;
--gofile | -g)
	SERVER=$(curl -s -m 15 https://apiv2.gofile.io/getServer | cut -d'"' -f10)
	LINK=$(curl -F "file=@$FILE" "https://$SERVER.gofile.io/uploadFile" | cut -d'"' -f10)
	echo "https://gofile.io/d/$LINK"
	;;
--transfer | -t)
	curl --upload-file "$FILE" "http://transfer.sh/$FILE" | tee /dev/null
	;;
*)
	echo $'Option    	  Site\n--0x0      | -0   https://0x0.st\n--bayfiles | -b   https://bayfiles.com\n--filepush | -f   https://filepush.co\n--gofile   | -g   https://gofile.io\n--transfer | -t   https://transfer.sh'
	;;
esac
