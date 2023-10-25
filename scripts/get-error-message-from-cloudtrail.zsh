#!/bin/zsh
# set profile to be used
export AWS_PROFILE=

# CloudTrail Event ID
eventId=<event_uuid>

if ! command -v jq &>/dev/null; then
  echo "You need to install jq"
  exit 1
fi

if ! command -v aws &>/dev/null; then
  echo "You need to install aws-cli"
  exit 1
fi

aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventId,AttributeValue="$eventId"  \
                      --query 'Events[*].CloudTrailEvent' | jq '.[0] | fromjson | .errorMessage' \
                      | xargs aws sts decode-authorization-message --encoded-message

