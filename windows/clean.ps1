$ErrorActionPreference="SilentlyContinue"
Stop-Process -Name nssm -Force -confirm:$false
if (Get-Service -Name Kubelet){
	cmd.exe /c sc delete kubelet
}
Stop-Process -Name wins -Force -confirm:$false
Get-Hnsnetwork | Remove-Hnsnetwork
Get-HnsNamespace | remove-HnsNamespace
Get-NetFirewallRule -Name Kubelet -ea silentlycontinue | Remove-NetFirewallRule

rm -force -r /k/* -confirm:$false
rm -force -r /var -confirm:$false
rm -force -r /etc -confirm:$false
rm -force -r /opt -confirm:$false
rm -force -r /sourcevip -confirm:$false
rm -force -r /C -confirm:$false
rm -force -r /etc -confirm:$false
