# kubernetes-coreos

TL;DR

I hacked something together in order to create a Kubernetes cluster on CoreOS (or Container Linux) using Vagrant and Ansible.

If you keep reading, I’m going to talk to you about Kubernetes, etcd, CoreOS, flannel, Calico, Infrastructure as Code and Ansible testing strategies. It’s gonna be super fun.

If you want to try it:

    git clone https://github.com/sebiwi/kubernetes-coreos
    cd kubernetes-coreos
    make up

This will spin up 4 VMs: an etcd node, a Kubernetes Master node, and two Kubernetes Worker nodes. You can modify the size of the cluster by hacking on the Vagrantfile and the Ansible inventory.

You will need Ansible 2.2, Vagrant, Virtualbox and kubectl. You will also need molecule and docker-py, if you want to run the tests.

You can find the articles related to this repository below:

- Kubernetes general architecure: http://blog.octo.com/en/how-does-it-work-kubernetes-episode-1-kubernetes-general-architecture/
