#!/bin/zsh
source ../shared/dependencies.zsh

export AWS_PAGER=""
export AWS_PROFILE=default

BASE_PATH=api
DOMAIN_NAME=acme.com

ID=$(aws apigateway get-base-path-mappings --domain-name "$DOMAIN_NAME" \
                                           --query "items[?basePath=='${BASE_PATH}'].restApiId" \
                                           --output text);

echo "API Gateway id=\"${ID}\"";
echo "$ID" | pbcopy
echo "Copied to clipboard"