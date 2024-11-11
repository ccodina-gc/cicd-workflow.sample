REGION=us-east1

echo "Get the project id and number"
PROJECT_ID=$(gcloud config get-value project)
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')

echo "Enable required services"
gcloud services enable \
  cloudbuild.googleapis.com \
  workflows.googleapis.com

echo "Grant the Workflows Admin role to the Cloud Build service account"
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com \
    --role=roles/workflows.admin

echo "Grant the IAM Service Account User role to the Cloud Build service account"
gcloud iam service-accounts add-iam-policy-binding \
    $PROJECT_NUMBER-compute@developer.gserviceaccount.com \
    --member=serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com \
    --role=roles/iam.serviceAccountUser