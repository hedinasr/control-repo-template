$role = lookup('role') |$not_found| {}

node default {

  if $role {
    notice("Node ${::fqdn} has role ${role}.")
    include "role::${role}"
  } else {
    warning("Node ${::fqdn} has no role set.")
    include profile::base
  }
}
