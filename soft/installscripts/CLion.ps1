mkdir c:\temp 
# downlowd CLion
$source = 'https://www.jetbrains.com/clion/download/download-thanks.html?platform=windows'
# Destination to save the file
$destination = 'c:\temp\clion.exe'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silentCLion.config'
# Destination to save the file
$destinationconf = 'c:\temp\silentCLion.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
cd c:\temp\
clion.exe /S /CONFIG=c:\temp\silentCLion.config /D=c:\IDE\CLion
