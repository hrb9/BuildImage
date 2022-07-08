# downlowd pytcham
$source = 'https://download.jetbrains.com/python/pycharm-professional-2022.1.3.exe?_gl=1*1mtapno*_ga*NDEwNDMzMTEzLjE2NTY1MTE1NzU.*_ga_9J976DJZ68*MTY1NjUxMTU3NC4xLjEuMTY1NjUxMTg0OC4w&_ga=2.56679971.884450988.1656511575-410433113.1656511575'
# Destination to save the file
$destination = 'c:\temp\pytcham.exe'
#Download the file
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silent.config'
# Destination to save the file
$destinationconf = 'c:\temp\silent.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
$pathvargs = {c:\temp\pytcham.exe /S /CONFIG=c:\temp\silent.config /D=c:\IDE\PyCharm }
Invoke-Command -ScriptBlock $pathvargs
