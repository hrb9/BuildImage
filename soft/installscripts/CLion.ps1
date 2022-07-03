mkdir c:\temp 
# downlowd CLion
$source = 'https://download.jetbrains.com/cpp/CLion-2022.1.3.exe?_gl=1*1c7v9b2*_ga*NDEwNDMzMTEzLjE2NTY1MTE1NzU.*_ga_9J976DJZ68*MTY1NjUxMTU3NC4xLjEuMTY1NjUxMTY3NS4w&_ga=2.216001054.884450988.1656511575-410433113.1656511575'
# Destination to save the file
$destination = 'c:\temp\clion.exe'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silentCLion.config'
# Destination to save the file
$destinationconf = 'c:\temp\silentCLion.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
#cd c:\temp\
## c:\temp\clion.exe /S /CONFIG=c:\temp\silentCLion.config /D=c:\IDE\CLion
