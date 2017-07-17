#profile/manifests/puppetmaster.pp
class profile::puppetmaster {

  # Setup R10k
  class { 'r10k':
    remote => 'git@github.com:ananasr/control-repo-template.git',
  }

  class {'r10k::webhook::config':
    use_mcollective => false,
  }

  class {'r10k::webhook':
    use_mcollective => false,
    user            => 'root',
    group           => '0',
    require         => Class['r10k::webhook::config'],
  }
}
