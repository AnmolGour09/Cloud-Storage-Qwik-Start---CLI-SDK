#!/bin/bash

# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'

# Define text formatting variables
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

clear

# Welcome message
echo "${CYAN_TEXT}${BOLD_TEXT}╔════════════════════════════════════════════════════════╗${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}                        Anmol Gour                        ${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}╚════════════════════════════════════════════════════════╝${RESET_FORMAT}"
echo


gcloud auth list
gcloud config list project
export PROJECT_ID=$(gcloud config get-value project)

# Create a new bucket
gsutil mb gs://$PROJECT_ID-anmol

# Download Ada Lovelace image
curl https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Ada_Lovelace_portrait.jpg/800px-Ada_Lovelace_portrait.jpg --output ada.jpg

# Upload image to your bucket
gsutil cp ada.jpg gs://$PROJECT_ID-anmol

# Remove local copy
rm ada.jpg

# Copy image back from bucket to local
gsutil cp -r gs://$PROJECT_ID-anmol/ada.jpg .

# Copy image into a folder in the bucket
gsutil cp gs://$PROJECT_ID-anmol/ada.jpg gs://$PROJECT_ID-anmol/image-folder/

# List bucket contents
gsutil ls gs://$PROJECT_ID-anmol

# Check detailed info of the file
gsutil ls -l gs://$PROJECT_ID-anmol/ada.jpg

# Make the image public
gsutil acl ch -u AllUsers:R gs://$PROJECT_ID-anmol/ada.jpg

# Final message
echo
echo "${CYAN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}              LAB COMPLETED SUCCESSFULLY!              ${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo
echo
