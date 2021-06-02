PROJECT_ID=$(shell gcloud config get-value core/project)
all:
	@echo "build  - Build the docker image"
	@echo "deploy - Deploy the image to Cloud Run"
	@echo "clean  - Clean resoruces created in this test"
	@echo "call   - Call the Cloud Run service"

deploy:
	gcloud run deploy cloud-run-exec-java \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java2 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java3 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java4 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java5 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java6 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java7 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java8 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java9 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy cloud-run-exec-java10 \
		--image gcr.io/$(PROJECT_ID)/cloud-run-exec-java \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 2Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m

build:
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/cloud-run-exec-java

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
