# vagrant-minix-gas: a Vagrant box with MINIX + GNU assembler

# ABOUT

vagrant-minix-gas is a placeholder for a Vagrant box having an assembler. In fact, MINIX (at least minix_R3.4.0rc6) includes `as` by default, so users may wish to leverage the [mcandre/minix](https://app.vagrantup.com/mcandre/boxes/minix) base box instead.

# VAGRANT CLOUD

https://app.vagrantup.com/mcandre/boxes/vagrant-minix-gas

# EXAMPLE

```console
$ vagrant up
$ vagrant ssh -c "cd /vagrant && as -o hello.o hello.s && ld -o hello hello.o && strip -s hello && ./hello"
Hello World!
```

# RUNTIME REQUIREMENTS

* [Vagrant](https://www.vagrantup.com)
* The [VirtualBox](https://www.virtualbox.org) hypervisor provider

## Recommended

* [vagrant-rsync-back](https://github.com/smerrill/vagrant-rsync-back) assists in copying artifacts from the guest to the host

# BUILDTIME REQUIREMENTS

* [Vagrant](https://www.vagrantup.com)
* The [VirtualBox](https://www.virtualbox.org) hypervisor provider
* [make](https://www.gnu.org/software/make/)

# EXPORT

```console
$ make vagrant-minix-gas.box
```
