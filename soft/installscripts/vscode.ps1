# downlowd Script
$source = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/source/vscodeinstall.ps1'
# Destination to save the file
$destination = 'c:\temp\vscodeinstall.ps1'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
#cd c:\temp\
c:\temp\vscodeinstall.ps1 -Architecture '64-bit'  
