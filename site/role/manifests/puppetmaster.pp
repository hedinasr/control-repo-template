#role/manifests/puppetmaster.pp
class role::puppetmaster {

  include profile::base
  include profile::puppetmaster
}
