echo "---------- INSTALLING KUBECTL, AWS-CLI, TERRAFORM  ----------"
sudo apt-get update -y
sudo snap install kubectl --classic
sudo snap install terraform --classic
sudo snap install aws-cli --classic

echo "---------- INSTALLING EKSCTL ----------"
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.147.0/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version


echo "---------- INSTALLING HELM ----------"
export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
