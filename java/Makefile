PROJECT_ID=$(shell gcloud config get-value core/project)
all:
	@echo "build  - Build the docker image"
	@echo "deploy - Deploy the image to Cloud Run"
	@echo "clean  - Clean resoruces created in this test"
	@echo "call   - Call the Cloud Run service"

deploy:
	gcloud run deploy jav \
		--image gcr.io/$(PROJECT_ID)/jav \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy jav3 \
		--image gcr.io/$(PROJECT_ID)/jav3 \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-east1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy jav4 \
		--image gcr.io/$(PROJECT_ID)/jav4 \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-east4 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy jav5 \
		--image gcr.io/$(PROJECT_ID)/jav5 \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-west1 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy jav6 \
		--image gcr.io/$(PROJECT_ID)/jav6 \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-west2 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy jav2 \
		--image gcr.io/$(PROJECT_ID)/jav2 \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-west3 \
		--allow-unauthenticated \
		--timeout 10m
	gcloud run deploy jav7 \
		--image gcr.io/$(PROJECT_ID)/jav7 \
		--min-instances 1000 \
		--max-instances 1000 \
		--cpu 4 \
		--memory 8Gi \
		--platform managed \
		--region us-west4 \
		--allow-unauthenticated \
		--timeout 10m
	
	
build:
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav2
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav3
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav4
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav5
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav6
	gcloud builds submit --tag gcr.io/$(PROJECT_ID)/jav7
	

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
