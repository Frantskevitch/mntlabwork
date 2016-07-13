# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  config.vm.define "web", primary: true do |web|
  	web.vm.hostname = "web"
  	web.vm.box = "./sbeliakou-vagrant-centos-6.7-x86_64.box"
  	web.vm.network "private_network", ip: "192.168.25.10"
	web.vm.provider "virtualbox" do |conf|
	 conf.name = "web-frontend"
	 conf.cpus = 1
	 conf.memory = 512
	end
web.vm.provision :file do |file|
  file.source = "./vhost.conf"
  file.destination = "/tmp/vhost.conf"
end

web.vm.provision :file do |file|
  file.source = "./worker.properties"
  file.destination = "/tmp/worker.properties"
end
	web.vm.provision "shell", path: "./web.sh"
	



  end
	
 config.vm.define "app" do |app|
  	app.vm.hostname = "app"
  	app.vm.box = "./sbeliakou-vagrant-centos-6.7-x86_64.box"
  	app.vm.network "private_network", ip: "192.168.25.11"
	app.vm.provider "virtualbox" do |conf|
	 conf.name = "app-backend"
	 conf.memory = 1024
         conf.customize ["modifyvm", :id, "--cpuexecutioncap", "35"]
	end
        app.vm.provision "shell", path:"./app.sh"
end  

config.vm.synced_folder "./sources/", "/mnt/sources",
owner:"vagrant", group:"vagrant",
create:true
end

