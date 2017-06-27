#!/bin/bash

# Redirect all outputs
exec > >(tee -i /tmp/cloud-init-bootstrap.log) 2>&1
set -xe

# Send signal to heat wait condition
# param:
#   $1 - status to send ("FAILURE" or "SUCCESS"
#   $2 - msg
function wait_condition_send() {
  local status=${1:-SUCCESS}
  local reason=${2:-empty}
  local data_binary="{\"status\": \"$status\", \"reason\": \"$reason\"}"
  echo "Sending signal to wait condition: $data_binary"
  $wait_condition_notify -k --data-binary "$data_binary"
  exit 1
}

$instance_cloud_init

sleep 1

wait_condition_send "SUCCESS" "Instance successfuly started."
