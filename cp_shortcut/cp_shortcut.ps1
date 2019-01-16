Get-ChildItem "\\ad\dep$\Config\shortcut" 

Copy-Item "\\ad\dep`$\Config\shortcut\Google Chrome.lnk" -Destination "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\"

