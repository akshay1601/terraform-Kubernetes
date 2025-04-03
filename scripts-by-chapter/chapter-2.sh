#./scripts-by-chapter/chapter-1.sh

echo "***************************************************"
echo "********* CHAPTER 2 - STARTED AT $(date) **********"
echo "***************************************************"
echo "--- This could take around 10 minutes"

# Getting NodeGroup IAM Role from Kubernetes Cluster
    nodegroup_iam_role=$(aws cloudformation list-exports --query "Exports[?contains(Name, 'nodegroup-eks-node-group::InstanceRoleARN')].Value" --output text | xargs | cut -d "/" -f 2)

# Installing Load Balancer Controller
    ( cd ./Infrastructure/k8s-tooling/load-balancer-controller && ./create.sh )
    # aws_lb_controller_policy=$(aws cloudformation describe-stacks --stack-name aws-load-balancer-iam-policy --query "Stacks[*].Outputs[?OutputKey=='IamPolicyArn'].OutputValue" --output text | xargs)
    # aws iam attach-role-policy --role-name ${nodegroup_iam_role} --policy-arn ${aws_lb_controller_policy}

# Create SSL Certfiicate in ACM
    terraform apply -auto-approve

# Installing ExternalDNS
    ./Infrastructure/k8s-tooling/external-dns/create.sh
    # aws iam attach-role-policy --role-name ${nodegroup_iam_role} --policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess

#  Create the DynamoDB Tables
    #terraform apply -auto-approve   



# Adding DynamoDB Permissions to the node
    # aws iam attach-role-policy --role-name ${nodegroup_iam_role} --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess


# Installing the applications
    ( cd ./resource-api/infra/helm && ./create.sh ) & \
    ( cd ./clients-api/infra/helm && ./create.sh ) & \
    ( cd ./inventory-api/infra/helm && ./create.sh ) & \
    ( cd ./renting-api/infra/helm && ./create.sh ) & \
    ( cd ./front-end/infra/helm && ./create.sh ) &

    wait

# Here's your application

echo "************************** HERE IS YOUR APP!!! **************************"
kubectl get ingress -n development front-end-development-ingress | grep bookstore | awk '{print $3}'
echo "**************************"


echo "*************************************************************"
echo "********* READY TO CHAPTER 3! - FINISHED AT $(date) *********"
echo "*************************************************************"