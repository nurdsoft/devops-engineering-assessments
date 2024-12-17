#!/bin/bash

# Assign arguments to variables with default values
WEBHOOK_URL=$1                         # Slack webhook URL
STATUS=$2                              # Deployment status
APP=${3:-"Terraform Deployment"}       # Application name
USERNAME=${4:-"Unknown User"}          # GitHub username
FULL_NAME=${5:-"Unknown Name"}         # Full name of the PR author

# Validate required arguments
if [ -z "$WEBHOOK_URL" ] || [ -z "$STATUS" ]; then
  echo "Usage: $0 <WEBHOOK_URL> <STATUS> [APP_NAME] [USERNAME] [FULL_NAME]"
  exit 1
fi

# Set appropriate messages and emojis based on the deployment status
case $STATUS in
  success)
    MESSAGE=":white_check_mark: Verification for *${APP}* was successful!"
    COLOR="good"
    ;;
  deploy-failed)
    MESSAGE=":x: Verification for *${APP}* failed. Deployment terminated."
    COLOR="danger"
    ;;
  *)
    MESSAGE=":grey_question: Unknown status for *${APP}*."
    COLOR="#808080" # Grey color for unknown status
    ;;
esac

# Compose the Slack message payload
NOTIFICATION=$(cat <<EOF
{
  "attachments": [
    {
      "color": "${COLOR}",
      "pretext": "Terraform Workflow Result for PR #${GITHUB_PULL_REQUEST:-"N/A"}",
      "text": "${MESSAGE}",
      "fields": [
        {"title": "Author", "value": "@${USERNAME}", "short": true},
        {"title": "Name", "value": "${FULL_NAME}", "short": true}
      ]
    }
  ]
}
EOF
)

# Send the message to Slack via the webhook
response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H 'Content-type: application/json' --data "${NOTIFICATION}" "${WEBHOOK_URL}")

# Check the response status
if [ "$response" -eq 200 ]; then
  echo "Notification sent successfully to Slack."
else
  echo "Failed to send notification to Slack. HTTP response: $response"
  exit 1
fi
