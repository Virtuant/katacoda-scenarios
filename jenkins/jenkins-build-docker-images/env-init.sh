#ssh root@host1 ""
ssh root@host1 -y
docker run -d -u root --name jenkins -p 8080:8080 -p 50000:50000 -v /root/jenkins:/var/jenkins_home jenkins/jenkins:lts
