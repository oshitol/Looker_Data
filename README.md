# Dataflow pipeline to transfer data from gis webservice to GCS

## Prerequisites

- Service Account for Cloud Run: <br>
         Below roles required for the Cloud Run Service Account<br>
            - storage.buckets.get<br>
            - storage.objects.create<br>
            - storage.objects.delete<br>

- GCS Bucket to stage data
  


## Overview
As soon as get request has been sent to the cloud run url it will fetch the data from rest endpoint for DEC hosted at https://gis.ny.gov/webservices and write into the GCS.

All the data written under the folder **web_services_incoming_data_files**. Raw data will be written in the raw folder structure and parsed data will be written in parsed folder structure as mentioned above in Prerequisites under section GCS Bucket to stage data. 

### Code Structure

## Folder dataflow

1. app.py - Python file which is the entry point of the program execution.

2. main.py - When this file gets called in app.py then it will read the data from the GIS feature layer and insert into GCS in raw and parsed folder structure.
  
3. requirements.txt - File containing package with version number.

4. config.py - Config file for cloud run. It contains the rest endpoint URL info in key, value pair. This makes easy to add new endpoint.

5. constant.py - File containing constants variables.

6. storage_util.py - A utility module to connect and insert in GCS.

7. parsing_util.py - A utility module which contains the parsing logic.

8. Dockerfile - A text file with instructions to build the image.

9. .dockerignore - File that allows to mention a list of files and/or directories which we might want to ignore while building the image.


## Push the image in the container registry

Navigate to the code directory and execute the below command.
```
gcloud builds submit --tag gcr.io/[Project_name]/[Folder_name]
```
Wait until the command finishes.


## Create the Service using cloud Run

Follow below steps to create a service.

1. Go to cloud run and click on the **CREATE SERVICE**
 
![cr0](https://user-images.githubusercontent.com/97659052/161500439-0c382907-b7e9-4384-bc7d-97aa0d390a66.JPG)
 
2. Select **Deploy one revision from an existing container image** and select the container image from the container registry. Refer below image.

![cr1](https://user-images.githubusercontent.com/97659052/161498726-dbdc8e86-ed41-4340-9d2a-b60e36721644.JPG)

3. Mention the name of the service and select the region from dropdown.

![cr2](https://user-images.githubusercontent.com/97659052/161498904-3adca5dc-32f7-4067-962a-7fb699b2afa6.JPG)

4. Under **Authentication** select **Allow unauthenticated invocations**

![cr3](https://user-images.githubusercontent.com/97659052/161499265-bbabd3c1-9a88-471e-8f01-0d260fd6c049.JPG)

6. Click on dropdown and select security tab and select the created user managed service account for cloud run.

![cr4](https://user-images.githubusercontent.com/97659052/161499273-71d94e93-bb75-43f3-be54-961dd72d9a04.JPG)

8. Click on create.

![cr5](https://user-images.githubusercontent.com/97659052/161499281-c76cf256-2618-463b-ab53-73028cd7e568.JPG)

9. Once the service has been created you will see and url example: https://wstogcs-ek5rl7cumq-uc.a.run.app

10. Click on the url to execute the container image and check the logs

## Create the service using gcloud command

We can create the service using below gcloud command

```
gcloud run deploy --service-account=SERVICE_ACCOUNT
```









 
