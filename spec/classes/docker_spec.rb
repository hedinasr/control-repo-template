require 'spec_helper'

describe 'profile::docker', :type => :class do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with default for all parameters' do
        it { is_expected.to create_class('profile::docker') }
      end

    end
  end
end
