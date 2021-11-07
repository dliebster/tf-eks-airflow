#  EKS+ provioner
#  blame dliebster
#  2021/11/07 v0.0

Goal: Automated EKS, Rancher, and Airflow cluster deployment.

Status: Validates, Deploys EKS (NodeGroup issues in Private subnets, Fargate is up for testing), installs Helm charts.  (WORK IN PROGRESS: pls check 'plan' output carefully in dev branch)

Needs: Rancher, Airflow, Create all Vars

Uses: us-gov-east-1 by default

Assumes: Suitable aws permissions to run EKS as well as some others such as r/w S3 bucket 

State Store:  s3://<place suitable bucket name here>/us--gov-east-1/tfstate/ohio/dev/

Presently working on Rancher, looks like that needs CertManager too.

(note: the initd style [10,20,30,...]_xxxx.tf naming convention is only to keep things in order in Dan's head for development, it serves no funtional purpose and will be depricated once dev is firmed up)

Based on Hashicorp' EKS tutorial @ https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster 
# tf-eks-airflow
