# profile/manifests/base.pp
class profile::base {

  include ntp
  include apt

  class { 'motd':
    content => "This is host ${::fqdn}."
  }

  create_resources('user', hiera_hash('user', {}))
  create_resources('group', hiera_hash('group', {}))
  create_resources('ssh_authorized_key', hiera_hash('ssh_authorized_keys', {}))

  $enhancers = [ 'tmux', 'htop', 'mlocate', 'lsb-release' ] # todo -> run updatedb after install mlocate
  package { $enhancers: ensure => 'installed' }
}
