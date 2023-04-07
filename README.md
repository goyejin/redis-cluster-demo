# redis-cluster-demo
Demo for create redis cluster instances.


## Usage

```sh
docker run -d -name redis-cluster \
           --restart always \
           -e REDIS_CLUSTER_ANNOUNCE_IP=192.168.1.100 \
           -p 9901-9906:9901-9906 \
           -p 19901-19906:19901-19906 \
           redis-cluster-demo
```
