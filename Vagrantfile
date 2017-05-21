$bootstrap = "\
yum update -y
yum install wget
wget -qO- https://get.docker.com/ | sh
gpasswd -a vagrant docker
service docker restart"


Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "../../../workspace", "/home/vagrant/workspace",create: true, owner: "vagrant", group: "vagrant", type: "virtualbox"
  config.vm.network "forwarded_port", guest: 81, host: 123

  config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell, inline: $bootstrap

end
