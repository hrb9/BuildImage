mkdir c:\temp
# downlowd Office
$source = 'https://github.com/hrb9/BuildImage/blob/main/soft/source/officeonetouch.exe?raw=true'

# Destination to save the file
$destination = 'c:\temp\officeonetouch.exe'
Invoke-WebRequest -Uri $source -OutFile $destination
c:\temp\officeonetouch.exe
