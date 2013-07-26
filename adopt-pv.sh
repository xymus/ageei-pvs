#!/bin/sh

if [ -z "$1" ]; then
	echo "expected PV markdown source file"
	exit 1
fi

base="${1%.*}"

set -x

make $base.pdf
make $base.html

git add $base.md $base.pdf $base.html
git commit -s
git push
