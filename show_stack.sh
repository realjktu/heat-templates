#!/bin/sh

echo "Salt master IP:"

heat output-show $1 salt_master_ip
