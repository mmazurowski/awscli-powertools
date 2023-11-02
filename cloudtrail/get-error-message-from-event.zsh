#!/bin/zsh
source ../shared/dependencies.zsh

export AWS_PROFILE=

# CloudTrail Event ID
eventId=<event_uuid>

aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventId,AttributeValue="$eventId"  \
                      --query 'Events[*].CloudTrailEvent' | jq '.[0] | fromjson | .errorMessage' \
                      | xargs aws sts decode-authorization-message --encoded-message