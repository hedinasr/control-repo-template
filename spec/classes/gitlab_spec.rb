require 'spec_helper'

describe 'profile::gitlab', :type => :class do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with default for all parameters' do
        it { is_expected.to create_class('profile::gitlab') }
        it { is_expected.to contain_class('gitlab') }
      end

    end
  end
end
