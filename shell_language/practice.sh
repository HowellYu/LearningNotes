#!/bin/bash # the profile you want to use

echo 'Welcome! Hello!'
file=source/changelog.md
firstline=$(head -1 $file)
read -a splitfirstline <<< $firstline # now printing splitfirst line will only print out the first word
echo ${splitfirstline[1]}
echo "Exit now? Enter '1' (for yes) to continue and '0' (for no) to exit."
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  for file in source/*
  do
    if [ "$file" == "source/secretinfo.md" ]
    then
      echo "Not copying" "$file"
    else
      echo "Copying" "$file"
      cp $file build/.
    fi
  done
else
  echo 'Please come back when you are ready'
fi

cd build
echo "Change directory to build, current version:" "${splitfirstline[1]}" # array indexing
cd ..
