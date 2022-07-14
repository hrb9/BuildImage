
#Set Temp Path
mkdir c:\temp
#######
#install#
#######

#Java#
# downlowd Java
$source = 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246474_2dee051a5d0647d5be72a7c0abff270e'
# Destination to save the file
$destination = 'c:\temp\java.exe'
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
#Execute-Process 'c:\temp\java.exe' -Arguments '/s INSTALL_SILENT=1 REBOOT=0 /L c:\temp\jre-8u45-windows-x64.log'
$pathvargs = {c:\temp\java.exe INSTALL_SILENT=1 }
Invoke-Command -ScriptBlock $pathvargs

#Python#
# This is the link to download current version of python from Python.org
# See https://www.python.org/downloads/
$pythonUrl = "https://www.python.org/ftp/python/3.10.5/python-3.10.5.exe"

# This is the directory that the exe is downloaded to
$tempDirectory = "C:\temp_provision\"

# Installation Directory
# Some packages look for Python here
$targetDir = "C:\Python"

# create the download directory and get the exe file
$pythonNameLoc = $tempDirectory + "python-3.10.5.exe"
New-Item -ItemType directory -Path $tempDirectory -Force | Out-Null
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
(New-Object System.Net.WebClient).DownloadFile($pythonUrl, $pythonNameLoc)

# These are the silent arguments for the install of python
# See https://docs.python.org/3/using/windows.html
$Arguments = @()
$Arguments += "/i"
$Arguments += 'InstallAllUsers="1"'
$Arguments += 'TargetDir="' + $targetDir + '"'
$Arguments += 'DefaultAllUsersTargetDir="' + $targetDir + '"'
$Arguments += 'AssociateFiles="1"'
$Arguments += 'PrependPath="1"'
$Arguments += 'Include_doc="1"'
$Arguments += 'Include_debug="1"'
$Arguments += 'Include_dev="1"'
$Arguments += 'Include_exe="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += 'InstallLauncherAllUsers="1"'
$Arguments += 'Include_lib="1"'
$Arguments += 'Include_pip="1"'
$Arguments += 'Include_symbols="1"'
$Arguments += 'Include_tcltk="1"'
$Arguments += 'Include_test="1"'
$Arguments += 'Include_tools="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += 'Include_launcher="1"'
$Arguments += "/passive"

#Install Python
Start-Process $pythonNameLoc -ArgumentList $Arguments -Wait

Function Get-EnvVariableNameList {
    [cmdletbinding()]
    $allEnvVars = Get-ChildItem Env:
    $allEnvNamesArray = $allEnvVars.Name
    $pathEnvNamesList = New-Object System.Collections.ArrayList
    $pathEnvNamesList.AddRange($allEnvNamesArray)
    return ,$pathEnvNamesList
}

Function Add-EnvVarIfNotPresent {
Param (
[string]$variableNameToAdd,
[string]$variableValueToAdd
   ) 
    $nameList = Get-EnvVariableNameList
    $alreadyPresentCount = ($nameList | Where{$_ -like $variableNameToAdd}).Count
    if ($alreadyPresentCount -eq 0)
    {
    [System.Environment]::SetEnvironmentVariable($variableNameToAdd, $variableValueToAdd, [System.EnvironmentVariableTarget]::Machine)
    [System.Environment]::SetEnvironmentVariable($variableNameToAdd, $variableValueToAdd, [System.EnvironmentVariableTarget]::Process)
    [System.Environment]::SetEnvironmentVariable($variableNameToAdd, $variableValueToAdd, [System.EnvironmentVariableTarget]::User)
        $message = "Enviromental variable added to machine, process and user to include $variableNameToAdd"
    }
    else
    {
        $message = 'Environmental variable already exists. Consider using a different function to modify it'
    }
    Write-Information $message
}

Function Get-EnvExtensionList {
    [cmdletbinding()]
    $pathExtArray =  ($env:PATHEXT).Split("{;}")
    $pathExtList = New-Object System.Collections.ArrayList
    $pathExtList.AddRange($pathExtArray)
    return ,$pathExtList
}

Function Add-EnvExtension {
Param (
[string]$pathExtToAdd
   ) 
    $pathList = Get-EnvExtensionList
    $alreadyPresentCount = ($pathList | Where{$_ -like $pathToAdd}).Count
    if ($alreadyPresentCount -eq 0)
    {
        $pathList.Add($pathExtToAdd)
        $returnPath = $pathList -join ";"
        [System.Environment]::SetEnvironmentVariable('pathext', $returnPath, [System.EnvironmentVariableTarget]::Machine)
        [System.Environment]::SetEnvironmentVariable('pathext', $returnPath, [System.EnvironmentVariableTarget]::Process)
        [System.Environment]::SetEnvironmentVariable('pathext', $returnPath, [System.EnvironmentVariableTarget]::User)
        $message = "Path extension added to machine, process and user paths to include $pathExtToAdd"
    }
    else
    {
        $message = 'Path extension already exists'
    }
    Write-Information $message
}

Function Get-EnvPathList {
    [cmdletbinding()]
    $pathArray =  ($env:PATH).Split("{;}")
    $pathList = New-Object System.Collections.ArrayList
    $pathList.AddRange($pathArray)
    return ,$pathList
}

Function Add-EnvPath {
Param (
[string]$pathToAdd
   ) 
    $pathList = Get-EnvPathList
    $alreadyPresentCount = ($pathList | Where{$_ -like $pathToAdd}).Count
    if ($alreadyPresentCount -eq 0)
    {
        $pathList.Add($pathToAdd)
        $returnPath = $pathList -join ";"
        [System.Environment]::SetEnvironmentVariable('path', $returnPath, [System.EnvironmentVariableTarget]::Machine)
        [System.Environment]::SetEnvironmentVariable('path', $returnPath, [System.EnvironmentVariableTarget]::Process)
        [System.Environment]::SetEnvironmentVariable('path', $returnPath, [System.EnvironmentVariableTarget]::User)
        $message = "Path added to machine, process and user paths to include $pathToAdd"
    }
    else
    {
        $message = 'Path already exists'
    }
    Write-Information $message
}

Add-EnvExtension '.PY'
Add-EnvExtension '.PYW'
Add-EnvPath 'C:\Python\'

# Install a library using Pip
python -m pip install numpy

# PowerShell to install Python, Boto, and AWSCLI
# Check for latest Python version and update link in following line.
Invoke-WebRequest -Outfile $env:userprofile\python.msi https://www.python.org/ftp/python/2.7.9/python-2.7.9.amd64.msi
msiexec.exe /i  $env:userprofile\python.msi /quiet
set PATH "%PATH%;C:\Python27;C:\Python27\Scripts"
setx PATH "%PATH%;C:\Python27;C:\Python27\Scripts"
Invoke-WebRequest -Outfile  $env:userprofile\pip.py https://bootstrap.pypa.io/get-pip.py
sleep 30
C:\Python27\python.exe  $env:userprofile\pip.py
C:\Python27\Scripts\pip.exe install boto
del $env:userprofile\pip.py
del $env:userprofile\python.msi

###CLion###
# downlowd CLion
$source = 'https://download.jetbrains.com/cpp/CLion-2022.1.3.exe?_gl=1*1c7v9b2*_ga*NDEwNDMzMTEzLjE2NTY1MTE1NzU.*_ga_9J976DJZ68*MTY1NjUxMTU3NC4xLjEuMTY1NjUxMTY3NS4w&_ga=2.216001054.884450988.1656511575-410433113.1656511575'
# Destination to save the file
$destination = 'c:\temp\clion.exe'
#Download the file
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
#Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silentCLion.config'
# Destination to save the file
$destinationconf = 'c:\temp\silentCLion.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
#cd c:\temp\
$pathvargs = {c:\temp\clion.exe /S /CONFIG=c:\temp\silentCLion.config /D=c:\IDE\CLion }
Invoke-Command -ScriptBlock $pathvargs

###IntelliJ###
# downlowd IntelliJ
$source = 'https://download.jetbrains.com/idea/ideaIU-2022.1.3.exe?_gl=1*13okudi*_ga*NDEwNDMzMTEzLjE2NTY1MTE1NzU.*_ga_9J976DJZ68*MTY1NjUxMTU3NC4xLjEuMTY1NjUxMTgwMS4w&_ga=2.56679971.884450988.1656511575-410433113.1656511575'
# Destination to save the file
$destination = 'c:\temp\intellij.exe'
#Download the file
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/installscripts/silentintellij.config'
# Destination to save the file
$destinationconf = 'c:\temp\silentintellij.config'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
$pathvargs = {c:\temp\intellij.exe /S /CONFIG=c:\temp\silentintellij.config /D=c:\IDE\intellij }
Invoke-Command -ScriptBlock $pathvargs

###Office###
# downlowd Office
$source = 'https://github.com/hrb9/BuildImage/raw/main/soft/source/officeonetouch.exe'
# Destination to save the file
$destination = 'c:\temp\officeonetouch.exe'
$wc = New-Object net.webclient
$wc.Downloadfile($source, $destination)
$pathvargs = {C:\temp\officeonetouch.exe}
Invoke-Command -ScriptBlock $pathvargs

#pytcham#
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

#VS-Community#
# downlowd Script
$source = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/source/vsinstall.ps1'
# Destination to save the file
$destination = 'c:\temp\vsinstall.ps1'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
$sourceconf = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/source/vs.17.json'
# Destination to save the file
$destinationconf = 'c:\temp\vs.17.json'
#Download the file
Invoke-WebRequest -Uri $sourceconf -OutFile $destinationconf
# cd c:\temp\
c:\temp\vsinstall.ps1 -Edition Community -quiet

#VS-Code#
# downlowd VS-CODE
$source = 'https://raw.githubusercontent.com/hrb9/BuildImage/main/soft/source/vscodeinstall.ps1'
# Destination to save the file
$destination = 'c:\temp\vscodeinstall.ps1'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
#cd c:\temp\
c:\temp\vscodeinstall.ps1 -Architecture '64-bit'  
