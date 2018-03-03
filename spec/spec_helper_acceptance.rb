require 'beaker-rspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      copy_module_to(host, :source => proj_root + '/site/profile', :module_name => 'profile')

      ['puppetlabs-stdlib', 'puppetlabs-apt', 'puppetlabs-ntp', 'puppetlabs-motd'].each do |mod|
        on host, puppet('module', 'install', mod),
           {:acceptable_exit_codes => [0]}
      end
    end
  end
end
