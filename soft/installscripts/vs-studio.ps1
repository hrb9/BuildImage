
mkdir c:\temp 
# downlowd Script
$source = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/source/vsinstall.ps1'
# Destination to save the file
$destination = 'c:\temp\vsinstall.ps1'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/source/vs.17.json'
# Destination to save the file
$destinationconf = 'c:\temp\vs.17.json'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
# cd c:\temp\
# c:\temp\vsinstall.ps1 -Edition Community -quiet
