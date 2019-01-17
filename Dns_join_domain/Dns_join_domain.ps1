get-content C:\Install\dns.txt |
	ForEach-Object{
		$ip = [System.Net.Dns]::GetHostAddresses($_)
		Get-WmiObject Win32_NetworkAdapterConfiguration -computername $_ -Filter 'IPEnabled=True' |
		Foreach-Object{
		If ($_.IpAddresses -contains $ip.AddressToSring) {
			Write-Host -ForegroundColor orange "Carte réseau détectée. Changement de la configuration DNS, et ajout au domaine $domaine..."
			$_.SetDNSServerSearchOrder(@('IP.IP.IP.IP', 'IP.IP.IP.IP'))
			$_.SetDynamicDNSRegistration($true)
		} else {
			Write-Host 'Adapter NOT found'
		}
	}
} | Out-Null

Get-NetAdapter -InterfaceIndex (Get-NetIPAddress | ? {$_.IPAddress -like 'IP.*'}).InterfaceIndex | Restart-NetAdapter

Start-Sleep -s 15

$domain = ""
$password = "" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\domaine" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
$OU = "OU=,OU=,DC=,DC="
Add-Computer -DomainName $domain -Credential $credential -OUPath $OU

if ($? -eq $true) {
Write-Host -ForegroundColor Green "

L'ordinateur $env:COMPUTERNAME a été ajouté au domaine $domain avec succès ! "
Write-Host -ForegroundColor DarkCyan "L'ordinateur $env:COMPUTERNAME va redémarrer"


Restart-Computer }

else {
Write-Host -ForegroundColor Magenta "

/!\ Une erreur s'est produite. L'ordinateur $env:COMPUTERNAME n'a pas été ajouté au domaine $domaine /!\" }



