Get-NetIPInterface | Where-Object {$_.AddressFamily -eq "IPv4"}
Write-Host "`n"
$Interface = Read-Host 'Quelle interface modifier ? (ifIndex)'
Write-Host "`nListe des adresses IP de l'interface :"
Get-NetIPAddress | Where-Object {$_.InterfaceIndex -eq $Interface} | Select-Object -Property IPAddress
$IP = Read-Host 'Quelle IP ajouter ?'
Write-Host "`n`n"

$Prefix = 24
New-NetIPAddress -InterfaceIndex $Interface -IPAddress $IP -PrefixLength $Prefix | out-null

