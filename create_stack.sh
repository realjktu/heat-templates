#!/bin/sh

heat stack-create -e env/$1/$2.env -f template/$1.hot $1_$2
