$ErrorActionPreference="SilentlyContinue"
Stop-Process -Name nssm -Force -confirm:$false -erroraction silentlycontinue
if (Get-Service -Name Kubelet){
	cmd.exe /c sc delete kubelet
}
Stop-Process -Name wins -Force -confirm:$false -erroraction silentlycontinue
Get-Hnsnetwork | Remove-Hnsnetwork
Get-HnsNamespace | remove-HnsNamespace
Get-NetFirewallRule -Name Kubelet -ea silentlycontinue | Remove-NetFirewallRule -ea silentlycontinue

rm -force -r /k/* -confirm:$false
rm -force -r /var -confirm:$false
rm -force -r /etc -confirm:$false
rm -force -r /opt -confirm:$false
