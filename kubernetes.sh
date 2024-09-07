#install kuberntes on rhel os
sudo -i 
sudo apt update -y
sudo apt upgarde -y
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
source ~/.bashrc
kubectl version


#TO uninstall command
#kubeadm reset
#sudo dnf remove kubeadm kubectl kubelet kubernetes-cni kube*

#remove autodependacies files tool
#sudo dnf autoremove

#Remove Related Files and Directories
#rm -rf ~/.kube
#rm -rf /etc/cni /etc/kubernetes rm -f /etc/apparmor.d/docker /etc/systemd/system/etcd*
#rm -rf /var/lib/dockershim /var/lib/etcd /var/lib/kubelet \/var/lib/etcd2/ /var/run/kubernetes

#Clear out the Firewall Tables and Rules
# iptables -F && iptables -X
# iptables -t nat -F && iptables -t nat -X
#iptables -t raw -F && iptables -t raw -X
# iptables -t mangle -F && iptables -t mangle -X
