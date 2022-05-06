#!/bin/bash
check=0
counter=0
while read line
do
if [[ $check == 1 ]]
then
echo $line | awk -v FS=">" '{print $2}' |  awk -v FS="<" '{print $1}'
((counter++))
check=0
fi
if [[ "$line" == *"<processors>"* ]]
then
  check=1
fi
done < $1
echo $counter
