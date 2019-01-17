Get-ChildItem "C:\Path\shortcut" 

Copy-Item "C:\Path\shortcut\Google Chrome.lnk" -Destination "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\"

