# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-7.3"

  config.vbguest.auto_update = false

  # Please rewrite and uncomment this line!
  config.vm.hostname = "local-docker.com"

  # Please rewrite and uncomment this line!
  config.vm.network "private_network", ip: "192.168.33.35"
  config.ssh.insert_key = false

  # Please rewrite and uncomment this line!
  # config.vm.synced_folder "D:\docks", "/home/vagrant/docks/"

  # Please list the domain name used in the Docker environment!
  config.hostsupdater.aliases = [
    "local-docker.com"
  ]

  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision "shell", :path => "docker-vagrant_init.sh", :privileged => false

  config.vm.network "forwarded_port", guest: 2375, host: 2375, host_ip: "127.0.0.1"
end