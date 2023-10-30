#!/bin/zsh

export AWS_PAGER=""
export AWS_PROFILE=default

if ! command -v aws &>/dev/null; then
  echo "You need to install aws-cli"
  exit 1
fi

BASE_PATH=api
DOMAIN_NAME=acme.com

ID=$(aws apigateway get-base-path-mappings --domain-name "$DOMAIN_NAME" \
                                           --query "items[?basePath=='${BASE_PATH}'].restApiId" --output text);

echo "API Gateway id=\"${ID}\"";

echo "$ID" | pbcopy

echo "Copied to clipboard"

