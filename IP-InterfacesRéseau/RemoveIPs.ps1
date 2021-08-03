Get-NetIPInterface | Where-Object {$_.AddressFamily -eq "IPv4"}
Write-Host "`n"
$Interface = Read-Host 'Quelle interface modifier ? (ifIndex)'
Get-NetIPAddress | Where-Object {$_.InterfaceIndex -eq $Interface} | Remove-NetIPAddress
Write-Host "`nListe des adresses IP de l'interface :"
Get-NetIPAddress | Where-Object {$_.InterfaceIndex -eq $Interface} | Select-Object -Property IPAddress
