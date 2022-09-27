# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  
	  BOX_IMAGE 		= "ubuntu/jammy64"
	  BASE_NETWORK	= "10.10.20"
	  
	  PROXY_HTTP		= "http://10.0.2.2:5865"
	  PROXY_HTTPS	= "http://10.0.2.2:5865"
	  PROXY_EXCLUDE 	= "localhost,127.0.0.1"
	  
	   BOX_CHK_UPDATE = true
		SSH_INSERT_KEY = false
		PROXY_ENABLE = false
		VB_CHK_UPDATE = true
	  
	  config.vm.define "web" do |subconfig|
		subconfig.vm.box = BOX_IMAGE
			subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.10", virtualbox__intnet: true
			subconfig.vm.network "forwarded_port", guest: 80, host: 9080
			if PROXY_ENABLE == true && Vagrant.has_plugin?("vagrant-proxyconf")
				#only use with plugin vagrant-proxy
				#print "setting proxy config"
				subconfig.proxy.http = PROXY_HTTP
				subconfig.proxy.https = PROXY_HTTPS
				subconfig.proxy.no_proxy = PROXY_EXCLUDE
			end
			if Vagrant.has_plugin?("vagrant-vbguest")
				subconfig.vbguest.auto_update = VB_CHK_UPDATE
			end
			subconfig.vm.box_check_update = BOX_CHK_UPDATE
			subconfig.ssh.insert_key = SSH_INSERT_KEY
			subconfig.vm.hostname = "mmweb.cpt.local"
			subconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
			subconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
			subconfig.vm.provision "shell", path: "./scripts/provision_php.sh"
        	subconfig.vm.synced_folder "./www/", "/var/www/html/"
			subconfig.vm.provider "virtualbox" do |vb|
				vb.name = "MMWeb"
				vb.memory = "1024"
				vb.cpus = 1
				#alter connection to the vm for more reliable boot
				vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
				vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
				#vb.gui = true	#enable only for debugging
				#provisioning
				


			end

	  end

	  config.vm.define "db" do |subconfig|
		subconfig.vm.box = BOX_IMAGE
			subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.15", virtualbox__intnet: true
			if PROXY_ENABLE == true
				#only use with plugin vagrant-proxy
				#print "setting proxy config"
				subconfig.proxy.http = PROXY_HTTP
				subconfig.proxy.https = PROXY_HTTPS
				subconfig.proxy.no_proxy = PROXY_EXCLUDE
			end
			if Vagrant.has_plugin?("vagrant-vbguest")
				subconfig.vbguest.auto_update = VB_CHK_UPDATE
			end
			subconfig.vm.box_check_update = BOX_CHK_UPDATE
			subconfig.ssh.insert_key = SSH_INSERT_KEY
			subconfig.vm.hostname = "mmdb.cpt.local"
			subconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
			subconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
			subconfig.vm.provision "shell", path: "./scripts/provision_php.sh"
			subconfig.vm.provision "shell", path: "./scripts/provision_mysql.sh"
			subconfig.vm.provision "shell", path: "./scripts/provision_schema.sh"
			subconfig.vm.provider "virtualbox" do |vb|
				vb.name = "MMDb"
				vb.memory = "1024"
				vb.cpus = 1
				#alter connection to the vm for more reliable boot
				vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
				vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
				#vb.gui = true	#enable only for debugging
				#provisioning
				

			end		

	  end

	end
