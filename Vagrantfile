Vagrant.configure("2") do |config|
  config.vm.define "centos" do |vbox|
    vbox.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "6144"]
    end

    vbox.vm.box = "centos/7"
    vbox.vm.network :private_network, ip: "192.191.91.10"
    vbox.vm.network "forwarded_port", guest: 80, host: 8080,auto_correct: true
	#jenkins
	vbox.vm.network "forwarded_port", guest: 8080, host: 8079,auto_correct: true
	#kafka
    vbox.vm.network "forwarded_port", guest: 3030, host: 3030,auto_correct: true
    vbox.vm.network "forwarded_port", guest: 2181, host: 2181,auto_correct: true
    vbox.vm.network "forwarded_port", guest: 8081, host: 8081,auto_correct: true
    vbox.vm.network "forwarded_port", guest: 8082, host: 8082,auto_correct: true
    vbox.vm.network "forwarded_port", guest: 8083, host: 8083,auto_correct: true
    vbox.vm.network "forwarded_port", guest: 9092, host: 9092,auto_correct: true
    vbox.vm.synced_folder "../../workspace-pc","/home/vagrant/workspace-pc",create: true, type: "virtualbox"
    vbox.vm.provision "file", source: "maven.sh", destination: "/tmp/maven.sh"
    vbox.vm.provision "shell", path: "provision.sh"
    config.vm.boot_timeout = 600

  end
end
