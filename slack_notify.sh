#!/bin/bash

WEBHOOK_URL=$1
STATUS=$2
APP=$3
AUTHOR=${4:-"Unknown User"}
PR_NUMBER=${5:-"N/A"}

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

NOTIFICATION="{
  \"attachments\": [
    {
      \"color\": \"$([ \"$STATUS\" == \"success\" ] && echo \"good\" || echo \"danger\")\",
      \"pretext\": \"Terraform Workflow Result for ${PR_NUMBER}\",
      \"text\": \"$MESSAGE\",
      \"fields\": [
        {\"title\": \"Author\", \"value\": \"@$AUTHOR\", \"short\": true},
        {\"title\": \"PR\", \"value\": \"${PR_NUMBER}\", \"short\": true}
      ]
    }
  ]
}"

curl -X POST -H 'Content-type: application/json' --data "$NOTIFICATION" ${WEBHOOK_URL}