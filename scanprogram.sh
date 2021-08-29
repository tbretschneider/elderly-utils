#!/bin/bash


./confirmation1.sh action
if [ $? -eq 0 ]; then
   echo OK
else
   echo FAIL
fi
