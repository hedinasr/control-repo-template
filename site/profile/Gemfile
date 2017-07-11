source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? ENV['PUPPET_VERSION'] : ['>= 3.3']

group :test do
  gem 'metadata-json-lint'
  gem 'puppetlabs_spec_helper', '>= 1.0.0'
  gem 'puppet-lint', '>= 1.0.0'
end

group :system_tests do
  gem 'beaker', :require => false
  gem 'beaker-rspec', :require => false
  gem 'beaker-puppet_install_helper', :require => false
end

gem 'puppet', puppetversion
gem 'facter', '>= 1.7.0'
gem 'rspec-puppet'
gem 'rspec-puppet-facts', '>= 1.8.0', :require => false

# rspec must be v2 for ruby 1.8.7
if RUBY_VERSION >= '1.8.7' && RUBY_VERSION < '1.9'
  gem 'rspec', '~> 2.0'
  gem 'rake', '~> 10.0'
else
  # rubocop requires ruby >= 1.9
  gem 'rubocop'
end
