#!/bin/bash

export OS_AUTH_URL=https://vpc.tcpisek.cz:5000/v2.0
export OS_AUTH_STRATEGY=keystone
export OS_PASSWORD=workshop

for ((i=0; i<10; i++)); do

  export OS_USERNAME=TCP_WORKSHOP_USER0$i
  export OS_TENANT_NAME=TCP_WORKSHOP_USER0$i

  echo ""
  echo "Lab #0$i:"

  nova list

done

for ((i=10; i<21; i++)); do

  export OS_USERNAME=TCP_WORKSHOP_USER$i
  export OS_TENANT_NAME=TCP_WORKSHOP_USER$i

  echo ""
  echo "Lab #$i:"

  nova list

done