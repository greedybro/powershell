Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

$install = "%PROGRAMEFILES%\LAPS\CSE\AdmPws.dll"
$path = "\\ad\dep$\Software\LAPS.x64.msi" 
$arg = @(
    "/i"
    "$path"
    "/qn"
    "/norestart"
    )

if ($(Test-path -Path $install) -eq $false) {

Start-Process "msiexec.exe" -ArgumentList $arg -wait 

} else { Exit-PSSession }