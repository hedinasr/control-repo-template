#role/manifests/backup.pp
class role::backup {

  include profile::base
  include profile::bareos
}
