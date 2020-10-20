#!/bin/sh -e

echo fargate-cli: `fargate --version`
echo aws-cli:     `aws --version`

export ASSUME_ROLE=$1
export CLUSTER=$2
export SERVICE=$3
export CONTAINER_IMAGE=$4
export AWS_REGION=eu-central-1

# we assume the role of the terraform user and deploy as that, the scripting puts the output into the environment variables
eval $(aws sts assume-role --role-arn $ASSUME_ROLE --role-session-name fargate-deploy | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')
fargate service deploy --service $SERVICE --image $CONTAINER_IMAGE --cluster $CLUSTER

