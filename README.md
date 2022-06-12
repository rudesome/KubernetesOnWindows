# Kubernetes on/with/and Windows
These are config files i used to get Windows node up and running with Kubernetes.

### Tested infra:

- Kubernetes: v1.22.9
- ContainerD: CP=1.59 - Windows=1.62
- CNI: Flannel - hostprocess (needs to be enabled)
- Windows Node: 2019 - Evaluation edition (1809)


### Instructions:

- Install master/cp node
- Install Flannel CNI
- Prep your windows 2019 (1809) Server (see Windows folder and the README.md)
- Run the test deployment yaml file
- Be amazed


### Proof?
```
 GATES
default       pod/win-webserver-6485b5485c-f29ns        1/1     Running   1 (<invalid> ago)   3h36m   10.244.1.6        win-bc85m23p883   <none>           <none>
default       pod/win-webserver-6485b5485c-k9j5n        1/1     Running   1 (<invalid> ago)   3h36m   10.244.1.5        win-bc85m23p883

root@cp-1:~# curl 10.244.1.6
<html><body><H1>Windows Container Web Server</H1><p>IP 10.244.1.6 callerCount 2 </body></html>

```
