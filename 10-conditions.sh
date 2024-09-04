#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ] #gt/lt,eq,!eq,<eq,>eq
then
    echo "Given number: $NUMBER is greater than 20"
else
    echo "Given number: $NUMBER is less tham 20"
fi      


