$Acl = Get-Acl "\\ad\dep$\ACL"
$path = "C:\users"


if ((Test-Path "C:\Users\Public\tmp\") -eq $false) {

(mkdir "C:\Users\Public\tmp\").attributes="Hidden"
Get-ChildItem $path -recurse -Force | Set-Acl -AclObject $Acl

}
else { break }