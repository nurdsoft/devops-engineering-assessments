#!/bin/bash

WEBHOOK_URL=$1
STATUS=$2
APP=$3
AUTHOR=${4:-"Unknown User"}
PR_NUMBER=${5:-"N/A"}

# Ensure PR_NUMBER does not have duplicate "PR"
CLEAN_PR_NUMBER="${PR_NUMBER}"

# Determine message based on status
if [[ "$STATUS" == "success" ]]; then
    MESSAGE=":white_check_mark: Verification for *${APP}* was successful!"
    COLOR="good"
elif [[ "$STATUS" == "deploy-failed" ]]; then
    MESSAGE=":x: Verification for *${APP}* failed. Deployment terminated."
    COLOR="danger"
else
    MESSAGE=":grey_question: Unknown status for *${APP}*."
    COLOR="warning"
fi

# Construct JSON notification using jq for proper escaping
NOTIFICATION=$(jq -n \
    --arg color "$COLOR" \
    --arg pretext "Terraform Workflow Result for PR $CLEAN_PR_NUMBER" \
    --arg text "$MESSAGE" \
    --arg author "@$AUTHOR" \
    --arg pr "$CLEAN_PR_NUMBER" \
    '{
      "attachments": [
        {
          "color": $color,
          "pretext": $pretext,
          "text": $text,
          "fields": [
            {"title": "Author", "value": $author, "short": true},
            {"title": "PR", "value": $pr, "short": true}
          ]
        }
      ]
    }')

# Debugging: Print JSON before sending (remove/comment this in production)
echo "Sending Slack Notification: $NOTIFICATION"

# Send the payload to Slack
curl -X POST -H 'Content-type: application/json' --data "$NOTIFICATION" "$WEBHOOK_URL"