#!/bin/bash

# REQUIRES JQ, KUBECTL, AND AZURE-CLI 

echo "alias k=kubectl" >> ~/.bashrc
echo "alias tf=terraform" >> ~/.bashrc
terraform version
echo "export MSYS_NO_PATHCONV=1" >> ~/.bashrc
SUBSCRIPTION_ID="44f5e459-fde2-4d80-9b6f-5634d124ae25"
az account set --subscription ${SUBSCRIPTION_ID}
pbcopy <<< $( az ad sp create-for-rbac --name tf-provider --role="Owner" --scopes="/subscriptions/${SUBSCRIPTION_ID}" )

echo `export ARM_SUBSCRIPTION_ID="${SUBSCRIPTION_ID}"` >> ./.env
echo `export ARM_CLIENT_ID=$( pbpaste | jq '. | {appId}[]' )` >> ./.env
echo `export ARM_TENANT_ID=$( pbpaste | jq '. | {tenant}[] ' )` >> ./.env
echo `export ARM_CLIENT_SECRET=$( pbpaste | jq '. | {password}[]' )` >> ./.bashrc

. ~/.bashrc
printenv | grep ^ARM*
