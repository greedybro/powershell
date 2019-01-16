Copy-Item -Path "\\ad\\dep$\Scripts\Remove_Local_User_&_Profile\Rm_local_profile.ps1" -Destination "C:\"

$users = Get-LocalUser | Where-Object -Property Enabled -EQ $true
$rm_profile = "C:\Rm_local_profile.ps1"

foreach ($user in $users){ 

& $rm_profile $user -force
Remove-LocalUser $user

}

rm "C:\Rm_local_profile.ps1"