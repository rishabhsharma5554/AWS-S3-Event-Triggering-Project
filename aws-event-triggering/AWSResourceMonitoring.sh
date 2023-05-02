#!/bin/bash

#############################
# Author: Rishabh Sharma
# Date: 2 May 2023
# Version : v1
# This Script will report AWS Resource Usage
# Without Shell Functions
#############################

# Debug mode 
# Print Each Command before it is created
set -x

# Things to capture 
# aws s3
# aws EC2
# aws lambda
# aws IAM Users

# List S3 buckets and capture it into a file
echo "Printing list of S3 Buckets and capturing it into a file"
aws s3 ls > resourceTracker

# List EC2 instances
echo "Printing list of EC2 instances"
#aws ec2 describe-instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List AWS Lambda functions
echo "Printing list of Lambda functions"
aws lambda list-functions

# List IAM users
echo "Printing list of IAM users"
aws iam list-users

# Disable debug mode
set +x

echo "AWS Resource usage report generation complete."