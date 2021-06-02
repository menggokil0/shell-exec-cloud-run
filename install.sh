gcloud services enable run.googleapis.com
git clone https://github.com/calebsto/shell-exec-cloud-run.git
cd shell-exec-cloud-run/python
make build && make deploy
