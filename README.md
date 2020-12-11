# Deploy a Production Ready Kubernetes Cluster

![Kubernetes Logo](https://raw.githubusercontent.com/kubernetes-sigs/kubespray/master/docs/img/kubernetes-logo.png)

## Requirements

- **Minimum required version of Kubernetes is v1.16**
- **Ansible v2.9+, Jinja 2.11+ and python-netaddr is installed on the machine that will run Ansible commands**
- The target servers must have **access to the Internet** in order to pull docker images
- The target servers are configured to allow **IPv4 forwarding**.


# Configurable Parameters in kubernetes deployment

## Common vars that are used in Cluster SetUp (configured in config_var.yaml)

* *spring_profiles* -
* *kube_network_plugin* - Sets k8s network plugin (default Calico)
* *slack_token* - 
* *slack_channel* - 
* *Loadbalancer_ip_range* - 
* *elk_replicas* - 
* *nexus_ip* - 

## Network Plugins

You can choose between 3 network plugins. (default: `calico`, except Vagrant uses `flannel`)

- [flannel](docs/flannel.md): gre/vxlan (layer 2) networking.

- [Calico](https://docs.projectcalico.org/latest/introduction/) is a networking and network policy provider. Calico supports a flexible set of networking options
    designed to give you the most efficient networking across a range of situations, including non-overlay
    and overlay networks, with or without BGP. Calico uses the same engine to enforce network policy for hosts,
    pods, and (if using Istio and Envoy) applications at the service mesh layer.

- [weave](docs/weave.md): Weave is a lightweight container overlay network that doesn't require an external K/V database cluster.
    (Please refer to `weave` [troubleshooting documentation](https://www.weave.works/docs/net/latest/troubleshooting/)).
    