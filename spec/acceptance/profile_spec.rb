require 'spec_helper_acceptance'

packages = [
  'vim',
  'tmux',
  'htop',
  'ntp',
  'lsb-release']

describe 'profile' do
  let(:manifest) {
    <<-EOS
include profile::base
EOS
  }

  it 'should apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end

  packages.each do |p|
    describe package(p), :if => os[:family] == 'debian' do
      it { should be_installed }
    end
  end

  describe service('ntp'), :if => os[:family] == 'debian' do
    it { should be_running }
    it { should be_enabled }
  end
end
