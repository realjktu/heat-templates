#!/bin/sh

# get args
ACTION="$1"
TEMPLATE="$2"
ENV="$3"
STACK="$4"

if [ -z "$ACTION" ] || [ -z "$TEMPLATE" ] || [ -z "$ENV" ] || [ -z "$STACK" ]; then
	# missing args
	echo "Usage: stack.sh <ACTION> <TEMPLATE> <ENV> <STACK>"
	echo "actions: validate, create, show, list, delete"
else
	# decide on action
	case "$ACTION" in
	"validate")
		openstack stack create --dry-run --environment "env/${TEMPLATE}/${ENV}.env" --template "template/${TEMPLATE}.hot" "${STACK}"
		;;
	"create")
		openstack stack create --environment "env/${TEMPLATE}/${ENV}.env" --template "template/${TEMPLATE}.hot" "$STACK"
		;;
	"show")
		openstack stack output show "${STACK}" salt_master_ip
		;;
	"show")
		openstack stack list
		;;
	"delete")
		openstack stack delete "${STACK}"
		;;
	*)
		echo "Action \"$ACTION\" is now known. Aborting!"
		;;
	esac
fi
