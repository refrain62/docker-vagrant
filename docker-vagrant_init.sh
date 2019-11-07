sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
sudo yum -y install docker-engine

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose
sudo mv /tmp/docker-compose /usr/bin/docker-compose
sudo chmod 775 /usr/bin/docker-compose
sudo docker-compose -v

find /usr/lib/systemd/system/docker.service -type f -print | xargs sed -i -e "s*ExecStart=/usr/bin/dockerd*ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375*g"
echo export DOCKER_HOST=tcp://127.0.0.1:2375 >> .bashrc

sudo service docker start
sudo chkconfig docker on
docker -v
