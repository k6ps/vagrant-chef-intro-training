# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty32"
	config.vm.provider "virtualbox" do |vb|
		vb.memory = "512"
	end
	config.berkshelf.enabled = true
	config.berkshelf.berksfile_path = "./cookbooks/samplewebapp/Berksfile"

	config.vm.define "app" do |app|
		app.vm.network "forwarded_port", guest: 8080, host: 9080
		app.vm.provision "chef_solo" do |chef|
			chef.add_recipe "samplewebapp"
		end
	end

	config.vm.define "service" do |service|
		service.vm.network "forwarded_port", guest: 8080, host: 9090
		service.vm.network "forwarded_port", guest: 27017, host: 27017
		service.vm.provision "chef_solo" do |chef|
			chef.add_recipe "samplewebapp::service"
		end
	end

end
