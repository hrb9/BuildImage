# downlowd IntelliJ
$source = 'https://download.jetbrains.com/idea/ideaIU-2022.1.3.exe?_gl=1*13okudi*_ga*NDEwNDMzMTEzLjE2NTY1MTE1NzU.*_ga_9J976DJZ68*MTY1NjUxMTU3NC4xLjEuMTY1NjUxMTgwMS4w&_ga=2.56679971.884450988.1656511575-410433113.1656511575'
# Destination to save the file
$destination = 'c:\temp\intellij.exe'
#Download the file
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silentCLion.config'
# Destination to save the file
$destinationconf = 'c:\temp\silentintellij.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
$pathvargs = {c:\temp\intellij.exe /S /CONFIG=c:\temp\silentintellij.config /D=c:\IDE\intellij }
Invoke-Command -ScriptBlock $pathvargs

