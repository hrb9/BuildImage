mkdir c:\temp 
# downlowd pytcham
$source = 'https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=windows'
# Destination to save the file
$destination = 'c:\temp\pytcham.exe'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silent.config'
# Destination to save the file
$destinationconf = 'c:\temp\silent.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
cd c:\temp\
pycharm-professional.exe /S /CONFIG=c:\temp\silent.config /D=c:\IDE\PyCharm
