## CORE INSTALLATION
apt-get -y update && \
apt-get install -y software-properties-common && \
apt-add-repository -y ppa:ansible/ansible && \
apt-get -y update && \
apt-get install -y ansible openssh-server && \
service ssh start
cd /home/scrapbook/tutorial
echo "Ready!"
