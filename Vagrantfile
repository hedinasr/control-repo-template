# -*- mode: ruby -*-
# # vi: set ft=ruby :

nodes = {
  "master" => { :ip => '172.16.66.2', :ram => 4096 }
}

Vagrant.configure("2") do |config|
  nodes.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vbox, override|
        cfg.vm.box = "centos/7"
        override.vm.hostname = hostname + ".box"
        override.vm.network :private_network,
                            :ip => info[:ip],
                            :virtualbox__intnet => true
        override.vm.network "forwarded_port", guest: 443, host: 4443
        vbox.cpus = 4
        vbox.memory = info[:ram]
        vbox.customize ["modifyvm", :id, "--nictype1", "virtio"]
      end

      if hostname.eql? "master"
        config.vm.provision "shell", inline: <<-SHELL
          yum -y install https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
          yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
          yum -y install https://yum.theforeman.org/releases/1.16/el7/x86_64/foreman-release.rpm
          yum -y install foreman-installer
          /opt/puppetlabs/puppet/bin/gem install r10k
          foreman-installer
          /opt/puppetlabs/puppet/bin/r10k puppetfile install --moduledir /vagrant/modules
        SHELL
      end

      config.vm.provision "puppet" do |puppet|
        puppet.module_path = ["modules", "site"]
        puppet.hiera_config_path = "hiera.yaml"
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "site.pp"
        #puppet.options = "--debug"

        #puppet.facter = {
        #  "role": "jenkins"
        #}
      end

      config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    end
  end
end
