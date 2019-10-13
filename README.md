# AWS Batch python Docker image deploy using Cloudformation

![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

## Get started
##### Step 1: Create a repository on AWS ECR for docker image:
``` aws ecr create-repository --repository-name <reporepository_name>```
##### Step 2: Build docker:
``` docker build -t my-image-for-batch . ```
##### Step 3: Login:
``` $(aws ecr get-login --no-include-email) ```
##### Step 4: Tag:
###### Get <repositoryUri> from Step 1.
``` docker tag my-image-for-batch:latest <repositoryUri>:latest ```
##### Step 5: Push to ECR:
``` docker push <repositoryUri>:latest```
##### Step 6: Create Batch stack using CloudFormation:
###### Replace <repositoryUri> from Step 1 in ``` template.json```  .
``` aws cloudformation create-stack --stack-name my-batch-stack --template-body file://template.json --capabilities CAPABILITY_IAM ```

##### Almost done :
``` aws batch submit-job --job-name example-job-name --job-queue <jobQueue name from step6>  --job-definition <jobDefinition name from step6> --container-overrides command=["python3","/root/src/app.py"]```
