PROJECT_ID=$(shell gcloud config get-value core/project)
all:
	@echo "build  - Build the docker image"
	@echo "deploy - Deploy the image to Cloud Run"
	@echo "clean  - Clean resoruces created in this test"
	@echo "call   - Call the Cloud Run service"

deploy:
	gcloud run deploy $(PROJECT_ID)sha256 \
		--image gcr.io/$(PROJECT_ID)/$(PROJECT_ID)sha256 \
		--min-instances 10 \
		--max-instances 10 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
		


build:
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/$(PROJECT_ID)sha256
	
clean:
	-gcloud container images delete gcr.io/$(PROJECT_ID)/cloud-run-exec-java --quiet
	-gcloud run services delete cloud-run-exec-java \
		--platform managed \
		--region us-central1 \
		--quiet

call:
	@echo "Calling Java Cloud Run service"
	@url=$(shell gcloud run services describe cloud-run-exec-java --format='value(status.url)' --region us-central1 --platform managed); \
	token=$(shell gcloud auth print-identity-token); \
	curl --request POST \
  		--header "Authorization: Bearer $$token" \
  		--header "Content-Type: text/plain" \
  		$$url/exec \
  		--data-binary "ps -ef"
