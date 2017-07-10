#role/manifests/web.pp
class role::web {

  include profile::base
  include profile::lamp
}
