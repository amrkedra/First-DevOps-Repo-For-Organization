#!/bin/bash
###################
#this project is to make report of AWS resources and send it as Cron job at 7PM
#Author : Amr Kedra
#date " 22/10/2023
#version : V1
##################

#resources to be tracked
# AWS EC2
# AWS S3
# AWS Lambda
# AWS IAM

date > //home/amrkedra/Desktop/DevOps/resourcetracker

echo 'S3 buckets:' >> //home/amrkedra/Desktop/DevOps/resourcetracker
aws s3 ls >> //home/amrkedra/Desktop/DevOps/resourcetracker

echo 'EC2 instances' >> //home/amrkedra/Desktop/DevOps/resourcetracker
aws ec2 describe-instances | grep InstanceId >> //home/amrkedra/Desktop/DevOps/resourcetracker

echo 'Lambda' >> //home/amrkedra/Desktop/DevOps/resourcetracker
aws lambda list-functions >> //home/amrkedra/Desktop/DevOps/resourcetracker

echo 'IAM users' >> //home/amrkedra/Desktop/DevOps/resourcetracker
aws iam list-users >> //home/amrkedra/Desktop/DevOps/resourcetracker

echo 'IAM Groups' >> //home/amrkedra/Desktop/DevOps/resourcetracker
aws iam list-groups >> //home/amrkedra/Desktop/DevOps/resourcetracker

echo 'end of the report'
