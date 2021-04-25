gcloud services enable run.googleapis.com
git clone https://github.com/calebsto/shell-exec-cloud-run.git
cd shell-exec-cloud-run/python
make build && make deploy
gcloud run services describe cloud-run-exec-python --format='value(status.url)' --region us-central1 --platform managed
gcloud auth print-identity-token
