#!/bin/bash
echo "Content-type: text/html"
echo ""
fFILES=`ls -l /acpc/prog/common/IDEs/codeblocks/* | awk ' { print $9 } '`
for f in $fFILES 
do
FILES=$(basename $f)
echo $FILES
done
