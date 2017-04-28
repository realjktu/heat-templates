#!/bin/bash

#RECLASS_ADDRESS="${RECLASS_ADDRESS:-https://github.com/ppetit/stacklight-salt-model.git}"
RECLASS_ADDRESS="${RECLASS_ADDRESS:-https://gerrit.mcp.mirantis.net/salt-models/stacklight}"
RECLASS_BRANCH="${RECLASS_BRANCH:-master}"
#LAB="${1:-mk22_lab_dvr}"
LAB="${1:-virtual_mcp10_dvr}"
ENV="${2:-tcpisek}"
STACK_NAME="${3:-ppetit_${LAB}}"
DOMAIN_NAME="mk22-lab-dvr.local"
export PYTHONWARNINGS="ignore:Unverified HTTPS request"
KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUGCb+mGidT4FRa4rJxoYx39NX2vCjRw+CmCQJW/Uf6xc0NNp5WRWJ0hnyIMRVVfehvfjdXPo4bO4cXIwmo06C1Wx+DMyvjI9NvuHtt52p3QTsh+PYZe5t4hFuGh7veWQw3LuLtDLVlVS633FQMgT/BXDaBc65yfN9CuV6lHqZ6KPKoGAi3ADlcQFqhFttO+GsVkxd6uGtelnbYXsDMwylCIKop0C/obu6wG85d/8Q2/Zts5CvUcCiCNfZtl8otgNMrpfnuhC0xAsmgwDxqK2kshxUujclyFfO7ixl+E9Plc7kUJvodNbzOcAmY3YpuHVoJQkHx/Ou81/q+JOVtFxz ppetit@baobab"
#KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0WtRus4W7AygS5FbDwO3gtC7nwmlnL8ShIuAV/TtakrLpIRW9zEyU67Hm7QhXMqrjnuuDifarXr1Ki25R4pSlO6MM6I7EF3wuUkWFIuEMIzSZDWimL63Nz8wyTda0plYezev9AFMTj/US+e+ecDH4A1fJmo5YOvNcFb7Kb9qJpTrh8p8B1yKTLfI6woJgxPKf3DosLDplnx8zePcpyNLqvMZRcAE//z9HMVF9lrefeW51LZZRA+KBygSgqX31D8/5rT5+ovqUgTfzCAzrUdCFVYxn65k09l2X6lZePa7iLFB2H4Nl/Wa3c/HqX3TL1V/HQarCZUX6SuYB8RRVMDmJQ== patrick.michel.petit@gmail.com"

if [ -z "$VIRTUAL_ENV" ]; then
   echo "Not in a Python virtual environment!"
   exit 1
fi

echo "Starting stack with model $RECLASS_ADDRESS (branch: $RECLASS_BRANCH). Press Enter to continue."
read _DUMMY
heat -k stack-create -e ~/mk-lab-heat-templates/env/"$LAB"/"$ENV".env -f ~/mk-lab-heat-templates/template/"$LAB".hot \
   -P key_value="$KEY"  -P cfg_reclass_address="$RECLASS_ADDRESS" -P cfg_reclass_branch="$RECLASS_BRANCH"  -P cfg_reclass_private_key="$(cat ~/.ssh/github_key)" \
   -P domain_name="$DOMAIN_NAME" --poll 10 "$STACK_NAME"
