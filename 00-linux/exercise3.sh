#!/bin/bash
DEF_TEXT='Que me gusta la bash!!!!'

# First of all we must check the number of arguments
if [ $# == 1 ]; then
  DEF_TEXT=$1
elif [ $# -gt 1 ]; then
  echo "Error: unexpected arguments."
  exit 1
fi

# Now we can include the commands from the previous exercises
mkdir -p foo/dummy foo/empty
echo $DEF_TEXT > foo/dummy/file1.txt
touch foo/dummy/file2.txt
echo "$(cat foo/dummy/file1.txt)" > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/