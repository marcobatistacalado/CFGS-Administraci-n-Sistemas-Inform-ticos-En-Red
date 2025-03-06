#!/bin/bash
num=1
while [ $num -le 5 ]
do
 echo "$num"
 num=`ex $num + 1`
done

echo ""

num=1
until [ $num -gt 5 ]
do 
 echo "$num"
 num=`ex $num + 1`
done
