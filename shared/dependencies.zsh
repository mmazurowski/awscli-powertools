if ! command -v jq &>/dev/null; then
  echo "You need to install jq"
  exit 1
fi

if ! command -v aws &>/dev/null; then
  echo "You need to install aws-cli"
  exit 1
fi