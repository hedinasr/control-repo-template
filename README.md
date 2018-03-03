control-repo [![Build Status](https://travis-ci.org/Ananasr/control-repo-template.svg?branch=production)](https://travis-ci.org/Ananasr/control-repo-template)
===============

# Setup

## Prerequisites

| Virtualbox |
| Vagrant    |

Install the `vagrant-vbguest` plugin to enable `synced_folder`.

```
vagrant plugin install vagrant-vbguest
vagrant plugin install sahara
```

Then you can run :
```
vagrant up --provison-with shell
vagrant sandbox on
```

At the end, you should see this message:

```
master:   Success!
master:   * Foreman is running at https://master.box
master:       Initial credentials are admin / SfUETVNvFKYe2RGG
master:   * Foreman Proxy is running at https://master.box:8443
master:   * Puppetmaster is running at port 8140
master:   The full log is at /var/log/foreman-installer/foreman.log

```

Run the Puppet provisioning:
```
vagrant provision --provision-with puppet
```

## TODO
- [ ] fix puppet lint rake task
- [ ] fix bug `vagrant sandbox rollback`
- [ ] use puppet agent instead of puppet apply
