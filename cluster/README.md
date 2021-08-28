# Local Cluster #
This project will introduce how to setup your local cluster environment. It is based
on the kubernates (an empty cluster) and exists NFS server. You can setup via the [k3s][0]
in your local machine. You can install k3s by simple command `curl -sfL https://get.k3s.io | sh -`,
and the kubeconfig.config will be located in */etc/rancher/k3s/k3s.yaml*.


The first step is create your dynamic-provides storage space, which is based on the
StorageClass in the kubernates. Based on this StorageClass we can setup the first service:
[MinIO][1] in the cluster.


[0]: https://k3s.io/
[1]: https://min.io/
