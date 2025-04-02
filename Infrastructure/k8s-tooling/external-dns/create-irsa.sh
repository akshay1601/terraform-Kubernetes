helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/

service_account_name="external-dns"

eksctl create iamserviceaccount --name ${service_account_name} \
    --cluster eks-acg \
    --attach-policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess --approve

helm upgrade --install external-dns \
    --values values.yaml \
    --set serviceAccount.create=false \
    --set serviceAccount.name=${service_account_name} \
    external-dns/external-dns