mkdir c:\temp 
# downlowd Sublime Text
$source = 'https://www.sublimetext.com/download_thanks?target=win-x64#direct-downloads'
# Destination to save the file
$destination = 'c:\temp\sublimetext.exe'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
cd c:\temp\
start-process -FilePath 'c:\temp\sublimetext.exe' -ArgumentList '/VERYSILENT'
