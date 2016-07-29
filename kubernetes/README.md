## kubernetes

`http://kubernetes.io/docs/getting-started-guides/scratch/`

```bash
etcdctl set /coreos.com/network/config '{ "Network": "172.16.0.0/16", "Backend": {"Type": "vxlan"} }'

KUBELETE_DNS_CLUSTER="--cluster-dns=192.168.3.10"
KUBELETE_DNS_CLUSTER_DOMAIN="--cluster-domain=cluster.local"
DOCKER_OPTS=" -H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock --bip=172.16.0.0/16 --mtu=1472" --iptables=false --dns=192.168.127.129 --bridge=flannel.1 --ip-masq=false
flanneld --listen=0.0.0.0:4001
kubectl get rc --namespace="kube-system"
```
