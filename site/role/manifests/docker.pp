#role/manifests/docker.pp
class role::docker {

  include profile::base
  include profile::docker
}
