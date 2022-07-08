# downlowd Office
$source = 'https://github.com/hrb9/BuildImage/raw/main/soft/source/officeonetouch.exe'
# Destination to save the file
$destination = 'c:\temp\officeonetouch.exe'
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
$pathvargs = {C:\temp\officeonetouch.exe}
Invoke-Command -ScriptBlock $pathvargs
