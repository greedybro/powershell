$32 = "\\ad\dep$\Scripts\Import_reg\Remove_Folders_32.reg"
$64 = "\\ad\dep$\Scripts\Import_reg\Remove_Folders_64.reg"

Copy-Item $32 -destination C:\Windows\Temp\
Copy-Item $64 -destination C:\Windows\Temp\

reg import "C:\Windows\Temp\Remove_Folders_32.reg" /reg:32
reg import "C:\Windows\Temp\Remove_Folders_64.reg" /reg:64


rm "C:\Windows\Temp\Remove_Folders_32.reg"
rm "C:\Windows\Temp\Remove_Folders_64.reg"