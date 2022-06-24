
# downlowd IntelliJ
$source = 'https://www.jetbrains.com/idea/download/download-thanks.html?platform=windows'
# Destination to save the file
$destination = 'c:\temp\intellij.exe'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silentCLion.config'
# Destination to save the file
$destinationconf = 'c:\temp\silentintellij.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
cd c:\temp\
c:\temp\intellij.exe /S /CONFIG=c:\temp\silentCLion.config /D=c:\IDE\intellij
