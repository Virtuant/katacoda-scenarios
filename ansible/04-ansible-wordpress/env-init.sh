# # CORE INSTALLATION
# apt-get -y update
# apt-get install -y software-properties-common
# apt-add-repository -y ppa:ansible/ansible
# apt-get -y update
# apt-get install -y ansible git
# cd /home/scrapbook/tutorial
#
# # DOCKER TARGET CONTAINER
# docker pull ubuntu:14.04
# docker network create mynetwork
# docker run -d --name target -p 8080 --rm --network mynetwork ubuntu:14.04 bash -c 'apt-get update; apt-get install -y openssh-server; service ssh start; while true; do sleep 60; echo keepalive; done'
# t() {  docker exec -it target bash -c "echo 'PS1='\''target# '\' >> /root/.bashrc; bash";  }
echo "Ready!"
