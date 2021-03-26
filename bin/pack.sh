#!/bin/bash

case $1 in
	-u)
		echo Decompressing brotli...
		brotli -d "$2.new.dat.br"
		echo Converting to image...
		sdat2img "$2.transfer.list" "$2.new.dat" "$2.img" >/dev/null
		mv "$2.img" "$2.raw.img"
	;;
	-r)
		echo Singing raw image
		img2simg "$2.raw.img" "$2.img"
		echo Converting to dat.br...
		img2sdat "$2.img" -o "$2" -v 4 -p "$2" >/dev/null
		brotli -3jf "$2/$2.new.dat"
esac