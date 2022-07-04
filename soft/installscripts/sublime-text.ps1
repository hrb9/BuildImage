mkdir c:\temp 
# downlowd Sublime Text
$source = 'https://download.sublimetext.com/sublime_text_build_4126_x64_setup.exe'
# Destination to save the file
$destination = 'c:\temp\sublimetext.exe'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
#cd c:\temp\
#start-process -FilePath 'c:\temp\sublimetext.exe' -ArgumentList '/VERYSILENT'
