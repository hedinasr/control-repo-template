require 'spec_helper'

describe 'profile::base', :type => :class do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'with hieradata defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package 'tmux' }
        it { is_expected.to contain_package 'htop' }
        it { is_expected.to contain_package 'mlocate' }
        it { is_expected.to contain_package 'lsb-release' }
      end

    end
  end
end
