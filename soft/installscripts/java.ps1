
# downlowd Java
$source = 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246474_2dee051a5d0647d5be72a7c0abff270e'
# Destination to save the file
$destination = 'c:\temp\java.exe'
Invoke-WebRequest -Uri $source -OutFile $destination
$pathvargs = {c:\temp\java.exe /s }
Invoke-Command -ScriptBlock $pathvargs

