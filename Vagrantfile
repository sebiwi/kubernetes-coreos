# -*- mode: ruby -*-
# # vi: set ft=ruby :

# General cluster configuration
$etcd_instances = 1
$etcd_instance_memory = 1024
$etcd_instance_cpus = 1
$kube_master_instances = 1
$kube_master_instance_memory = 2048
$kube_master_instance_cpus = 1
$kube_worker_instances = 2
$kube_worker_instance_memory = 2048
$kube_worker_instance_cpus = 1

Vagrant.configure("2") do |config|
  # SSH configuration
  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  # Hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false

  # Box management: CoreOS
  config.vm.box = "coreos-stable"
  config.vm.box_url = "https://storage.googleapis.com/stable.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"

  # etcd instances configuration
  (1..$etcd_instances).each do |i|
    config.vm.define vm_name = "etcd-%02d" % i do |etcd|
      # Name
      etcd.vm.hostname = vm_name

      # RAM, CPU
      etcd.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.memory = $etcd_instance_memory
        vb.cpus = $etcd_instance_cpus
      end

      # IP
      etcd.vm.network :private_network, ip: "10.0.0.#{i+100}"
    end
  end

  # Kubernetes Master instances configuration
  (1..$kube_master_instances).each do |i|
    config.vm.define vm_name = "kube-master-%02d" % i do |master|
      # Name
      master.vm.hostname = vm_name

      # RAM, CPU
      master.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.memory = $kube_master_instance_memory
        vb.cpus = $kube_master_instance_cpus
      end

      # IP
      master.vm.network :private_network, ip: "10.0.0.#{i+110}"
    end
  end

  # Kubernetes Worker instances configuration
  (1..$kube_worker_instances).each do |i|
    config.vm.define vm_name = "kube-worker-%02d" % i do |worker|
      # Name
      worker.vm.hostname = vm_name

      # RAM, CPU
      worker.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.memory = $kube_worker_instance_memory
        vb.cpus = $kube_worker_instance_cpus
      end

      # IP
      worker.vm.network :private_network, ip: "10.0.0.#{i+120}"
    end
  end
end
