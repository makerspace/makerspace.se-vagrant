Vagrant::Config.run do |config|
  config.vm.box       = 'precise32'
  config.vm.box_url   = 'http://files.vagrantup.com/precise32.box'
  config.vm.host_name = 'makerspace-dev'

  config.vm.forward_port 80, 3000
  #config.vm.network :private_network, ip: "192.168.88.2" # The virtual ip

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.options = [
        '--verbose',
    ]
  end
end
