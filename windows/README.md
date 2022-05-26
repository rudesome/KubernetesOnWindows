# Windows
preassuming you are using a Windows 10 host OS

## Prerequisites Windows:

- `bcdedit /set hypervisorlaunchtype off`
- WSL disabled
- bios hyper threading enabled
- Virtualize Intel VT-x/EPT or AMD-V/RVI enabled (VMware Workstation)

## Commands:

install containerD:
- .\Install-Containerd.ps1 -ContainerDVersion 1.6.2 -CNIConfigPath "c:/etc/cni/net.d" -CNIBinPath "c:/opt/cni/bin"

prep your windows node to join k8s cluster:
- .\PrepareNode.ps1 -KubernetesVersion 1.22.9 -ContainerRuntime ContainerD

join the k8s cluster:
- kubeadm join 192.168.129.129:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash> --cri-socket "npipe:////./pipe/containerd-containerd"

enable hostprocess:
add the flag: "--feature-gates=WindowsHostProcessContainers=true"
to file: C:\var\lib\kubelet\kubeadm-flags.env
example:
```
KUBELET_KUBEADM_ARGS="--container-runtime=remote --container-runtime-endpoint=npipe:////./pipe/containerd-containerd --pod-infra-container-image=k8s.gcr.io/pause:3.5 --feature-gates=WindowsHostProcessContainers=true"
```

reboot the windows node if it is still in a "not ready" state
