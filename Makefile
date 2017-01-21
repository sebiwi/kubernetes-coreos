.PHONY: up vagrant playbook smoketest test clean

up: vagrant playbook

vagrant:
	@vagrant up
	@vagrant ssh-config > ssh.config

playbook:
	@ansible-playbook -i inventories/vagrant.ini kubernetes.yml

smoketest:
	@ansible-playbook -i inventories/vagrant.ini kubernetes.yml --tags test

test:
	@molecule test

clean:
	@vagrant destroy -f
	@rm -rf kubernetes-resources
	@rm ssh.config
