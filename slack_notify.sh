#!/bin/bash

# Assigning arguments to variables
WEBHOOK_URL=$1              # Slack webhook URL to send the message
STATUS=$2                   # Status of the deployment process
APP=${3:-"Terraform Deployment"} # Application name
USERNAME=${4:-"Unknown User"}    # GitHub username of the PR author
FULL_NAME=${5:-"Unknown Name"}   # Full name of the PR author

# Set appropriate messages and emojis based on the deployment status
case $STATUS in
    success)
        MESSAGE=":white_check_mark: Verification for *${APP}* was successful!"
        ;;
    deploy-failed)
        MESSAGE=":x: Verification for *${APP}* failed. Deployment terminated."
        ;;
    *)
        MESSAGE=":grey_question: Unknown status for *${APP}*."
        ;;
esac

# Compose the Slack message
NOTIFICATION="{
  \"attachments\": [
    {
      \"color\": \"$([ \"$STATUS\" == \"success\" ] && echo \"good\" || echo \"danger\")\",
      \"pretext\": \"Terraform Workflow Result for PR #${GITHUB_PULL_REQUEST}\",
      \"text\": \"$MESSAGE\",
      \"fields\": [
        {\"title\": \"Author\", \"value\": \"@$USERNAME\", \"short\": true},
        {\"title\": \"Name\", \"value\": \"$FULL_NAME\", \"short\": true}
      ]
    }
  ]
}"

# Send the message to Slack via the webhook
curl -X POST -H 'Content-type: application/json' --data "$NOTIFICATION" ${WEBHOOK_URL}