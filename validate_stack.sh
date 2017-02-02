#!/bin/sh

heat -d template-validate -e env/$1/$2.env -f template/$1.hot
