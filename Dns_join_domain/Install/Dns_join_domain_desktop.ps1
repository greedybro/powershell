get-content C:\Install\dns.txt |
	ForEach-Object{
		$ip = [System.Net.Dns]::GetHostAddresses($_)
		Get-WmiObject Win32_NetworkAdapterConfiguration -computername $_ -Filter 'IPEnabled=True' |
		Foreach-Object{
		If ($_.IpAddresses -contains $ip.AddressToSring) {
			Write-Host -ForegroundColor Blue "Carte réseau détectée. Changement de la configuration DNS, et ajout au domaine $domaine..."
			$_.SetDNSServerSearchOrder(@('172.16.1.226', '10.0.0.1'))
			$_.SetDynamicDNSRegistration($true)
		} else {
			Write-Host 'Adapter NOT found'
		}
	}
} | Out-Null

Get-NetAdapter -InterfaceIndex (Get-NetIPAddress | ? {$_.IPAddress -like '10.*'}).InterfaceIndex | Restart-NetAdapter

Write-Output "En attente du rédémarrage de la carte réseau"
Start-Sleep -Seconds 5 

$domain = "geolid.local"
$password = "geogeo@1" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\domaine" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
$OU = "OU=desktop,OU=geolid,DC=geolid,DC=local"
Add-Computer -DomainName $domain -Credential $credential -OUPath $OU

if ($? -eq $true) {
Write-Host -ForegroundColor Green "

L'ordinateur $env:COMPUTERNAME a été ajouté au domaine $domain avec succès ! "
Write-Host -ForegroundColor DarkCyan "L'ordinateur $env:COMPUTERNAME va redémarrer"

Start-Sleep -s 5
Restart-Computer }

else {
Write-Host -ForegroundColor Magenta "

/!\ Une erreur s'est produite. L'ordinateur $env:COMPUTERNAME n'a pas été ajouté au domaine $domaine /!\" }



