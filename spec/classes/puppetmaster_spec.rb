require 'spec_helper'

describe 'profile::puppetmaster', :type => :class do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      facts.merge!({ :is_pe => false, :puppet_environmentpath => '/etc/puppetlabs/code/environment', })

      context 'with default for all parameters' do
        it { is_expected.to create_class('profile::puppetmaster') }
        it { is_expected.to contain_class('r10k') }
        it { is_expected.to contain_class('r10k::webhook') }
        it { is_expected.to contain_class('r10k::webhook::config') }
      end

    end
  end
end
