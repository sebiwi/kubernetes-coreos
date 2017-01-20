.PHONY: up vagrant playbook clean

up: vagrant playbook

vagrant:
	@vagrant up
	@vagrant ssh-config > ssh.config

playbook:
	@ansible-playbook -i inventories/vagrant.ini kubernetes.yml

test:
	@molecule test

clean:
	@vagrant destroy -f
	@rm -rf kubernetes-resources
	@rm ssh.config
