#!/bin/bash

# php-version/base-image/run-type
# 

bn=`echo $PWD | awk -F"/" '{print $(NF-2)"-"$NF"-"$(NF-1)}'`
# echo $bn
# git checkout -b ${bn} 
