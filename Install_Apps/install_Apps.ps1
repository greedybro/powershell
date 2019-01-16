# GOOGLE DRIVE FILE STREAM #

$path_GDFS = "C:\Program Files\Google\Drive file stream"
$test_GDFS = Test-Path $path_GDFS 

    If ($test_GDFS -eq $false)  {
        Start-Process "\\ad\dep$\Software\GoogleDriveFSSetup.exe" -ArgumentList "--silent --desktop_shortcut" }

# FIREFOX #

$path_FIREFOX = "C:\Program Files\mozilla firefox\firefox.exe"
$test_FIREFOX = Test-Path $path_FIREFOX 

    If ($test_FIREFOX -eq $false)  {
        Start-Process "\\ad\dep$\Software\Firefox Setup 63.0.3.exe" /S }

# TEAMVIEWER #

$path_TEAMVIEWER = "C:\Program Files (x86)\mozilla firefox\firefox.exe"
$test_TEAMVIEWER = Test-Path $path_TEAMVIEWER 


    If ($test_TEAMVIEWER -eq $false)  {
        Start-Process "\\ad\dep$\Software\TeamViewer_Setup.exe" /S }


# 7-zip #

$path_7zip = "C:\Program Files\7-Zip"
$path2_7zip = "C:\Program Files (x86)\7-Zip"
$test_7zip = Test-Path $path_7zip
$test2_7zip = Test-Path $path2_7zip

    If ($test_7zip -or $test2_7zip -eq $false)  {
        Start-Process "\\ad\dep$\Software\7z1805-x64.exe" /S }

# AGENT NOVATIM #

$path_NOVATIM = "C:\Program Files\Advanced Monitoring Agent\winagent.exe"
$path2_NOVATIM = "C:\Program Files (x86)\Advanced Monitoring Agent\\winagent.exe"
$test_NOVATIM = Test-Path $path_NOVATIM 
$test2_NOVATIM = Test-Path $path2_NOVATIM

    If ($test_NOVATIM -or $test2_NOVATIM -eq $false)  {
        Start-Process "\\ad\dep$\Software\AGENT_76941_V10_7_10_RW.EXE" /S }