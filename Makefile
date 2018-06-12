BOX_NAMESPACE=mcandre
BOX_BASENAME=vagrant-minix-gas
BOX=$(BOX_BASENAME).box

.PHONY: launch-vm clean-vm clean-boxes clean-vagrant-metadata

launch-vm: Vagrantfile
	vagrant up

test: launch-vm
	vagrant ssh -c "cd /vagrant && as -o hello.o hello.s && ld -o hello hello.o && strip -x hello.o && ./hello"

clean-vm:
	-vagrant destroy -f

clean-boxes:
	-rm -rf *.box

clean-vagrant-metadata:
	-rm -rf .vagrant

clean: clean-boxes clean-vm clean-vagrant-metadata

$(BOX): export.Vagrantfile clean launch-vm
	vagrant package --output $(BOX) --vagrantfile export.Vagrantfile

install-box-virtualbox: $(BOX)
	vagrant box add --force --name $(BOX_NAMESPACE)/$(BOX_BASENAME) $(BOX)
