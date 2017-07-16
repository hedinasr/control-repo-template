require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet'
require 'rspec-puppet-facts'
include RspecPuppetFacts

RSpec.configure do |c|
  #c.hiera_config = File.expand_path(__FILE__, '../fixtures/hiera.yaml')
  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
end
