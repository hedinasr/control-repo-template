# profile/manifests/base.pp
class profile::base {

  if $::osfamily == 'Debian' {
    include ntp
    include apt

    class { 'motd':
      content => "This is host ${::fqdn}.",
    }

    create_resources('user', hiera_hash('user', {}))
    create_resources('group', hiera_hash('group', {}))
    create_resources('ssh_authorized_key', hiera_hash('ssh_authorized_keys', {}))

    $enhancers = [ 'vim', 'tmux', 'htop', 'mlocate', 'lsb-release' ] # todo -> run updatedb after install mlocate
    package { $enhancers:
      ensure  => 'installed',
      require => Exec['apt_update'],
    }
  }
  else {
    warning ('os not (yet) supported!')
  }
}
