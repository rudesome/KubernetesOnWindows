$ErrorActionPreference="SilentlyContinue"
Stop-Process -Name nssm -Force -confirm:$false
if (Get-Service -Name Kubelet){
	cmd.exe /c sc delete kubelet
}
Get-Hnsnetwork | Remove-Hnsnetwork
Get-HnsNamespace | Remove-HnsNamespace
Get-NetFirewallRule -Name Kubelet | Remove-NetFirewallRule

Stop-Process -Name wins -Force -confirm:$false
rm -force -r /k/* -confirm:$false
rm -force -r /var -confirm:$false
rm -force -r /etc -confirm:$false
rm -force -r /opt -confirm:$false
rm -force -r /sourcevip -confirm:$false
rm -force -r /C -confirm:$false
rm -force -r /etc -confirm:$false
