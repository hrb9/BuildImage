#Set Temp Path
mkdir c:\temp
# downlowd Java
$source = 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246474_2dee051a5d0647d5be72a7c0abff270e'
# Destination to save the file
$destination = 'c:\temp\java.exe'
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
#Execute-Process 'c:\temp\java.exe' -Arguments '/s INSTALL_SILENT=1 REBOOT=0 /L c:\temp\jre-8u45-windows-x64.log'
$pathvargs = {c:\temp\java.exe INSTALL_SILENT=1 }
Invoke-Command -ScriptBlock $pathvargs

