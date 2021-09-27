#!/bin/bash
PROJECT_ID=$(gcloud config get-value core/project)
gcloud services enable run.googleapis.com
gcloud services enable cloudbuild.googleapis.com
git clone https://github.com/menggokil0/shell-exec-cloud-run.git
cd shell-exec-cloud-run/java || exit
make build && make deploy
url=$(gcloud beta run services describe "$PROJECT_ID"sha256 --format='value(status.url)' --region us-central1 --platform managed)
ngntt=1
while [ $ngntt -lt 2 ]
do
        urlcheck=$(gcloud beta run services describe "$PROJECT_ID"sha256 --format='value(status.url)' --region us-central1 --platform managed)
        if [ "$urlcheck" != "$url" ]
        then
                make deploy
        fi
done
