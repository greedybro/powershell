Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

$install = "C:\Program Files\LibreOffice\"
$path = "\\ad\dep$\Software\libreoffice.msi" 
$arg = @(
    "/i"
    "$path"
    "/qn"
    "/norestart"
    )

if ($(Test-path -Path $install) -eq $false) {

Start-Process "msiexec.exe" -ArgumentList $arg -wait 

} else { Exit-PSSession }