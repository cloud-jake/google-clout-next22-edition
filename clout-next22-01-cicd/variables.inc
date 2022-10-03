# Google Clout - CI/CD in a Google Cloud World
# https://www.cloudskillsboost.google/games/3085/labs/18831

export PROJECT_ID=""
export REGION=""

export REPO="pop-kustomize"
export SA=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")@cloudbuild.gserviceaccount.com

