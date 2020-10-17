# Plone on Google Cloudrun
This is just a quick proof of concept.
Was working on something else for Cloudrun and figured Plone on docker
should be easy to get running.

# Assumptions
You have a gcloud account and have created a project

# Quick start
## Step 1 - Install gcloud
You can get it here: https://cloud.google.com/sdk/docs/install

## Step 2 -  Initialize gcloud
```
gcloud init
```
## Step 3 - Checkout
```
git clone https://github.com/collective/plone-on-cloudrun
```

## Step 4 - Deploy
```
cd plone-on-cloudrun
export CLOUDRUN_PROJECT_NAME=your-project-name
gcloud builds submit --tag gcr.io/$CLOUD_RUN_PROJECT_NAME/plone --timeout=3000
gcloud run deploy plone --image gcr.io/$CLOUD_RUN_PROJECT_NAME/plone --platform managed --port 8080 --memory 1Gi --timeout 1m30s
```

# Things to do next
This looks very promising. I think we could get a lot done with a bit more attention.
- Still need to figure out serving properly over https (will require a bit of virtual host monster "gymnastics")
- Need a sensible approach to loading add-ons
- Might be nice to make this a quick way to spin up a Volto backend
