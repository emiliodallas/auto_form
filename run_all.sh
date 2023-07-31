#!/usr/bin/bash
echo "Today is " `date`

echo -e "\nenter the path to directory:"
read the_path

echo -e "\n your path has the following archives and folders in it:"
ls $the_path
