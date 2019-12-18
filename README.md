# AWS Batch python Docker image deploy using Cloudformation

![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

## Get started

##### Step 1: Create Batch stack using CloudFormation:
``` aws cloudformation create-stack --stack-name my-batch-stack --template-body file://template.json --capabilities CAPABILITY_IAM --region us-east-2```

##### Step 2: Build docker:
``` docker build -t my-image-for-batch . ```

##### Step 3: Login:
``` $(aws ecr get-login --no-include-email) ```
##### Step 4: Tag:
###### Get <repositoryUri> from Step 1.
``` docker tag my-image-for-batch:latest <repositoryUri>:latest ```

##### Step 5: Push to ECR:
###### Get <repositoryUri> from Step 1.
``` docker push <repositoryUri>:latest```

##### Almost done :
``` aws batch submit-job --job-name example-job-name --job-queue <jobQueue name from step6>  --job-definition <jobDefinition name from step6> --container-overrides command=["python3","/root/src/app.py"]```
