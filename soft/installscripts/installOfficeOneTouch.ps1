mkdir c:\temp
# downlowd Office
$source = 'https://github.com/hrb9/BuildImage/raw/main/soft/source/officeonetouch.exe'

# Destination to save the file
$destination = 'c:\temp\officeonetouch.exe'
Invoke-WebRequest -Uri $source -OutFile $destination
c:\temp\officeonetouch.exe
