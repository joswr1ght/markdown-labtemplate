# Update-Lab.ps1
# Created by Mick Douglas (@BetterSafetyNet) 20190324 for SANS SEC 504

# About this script:
# When run, this will update the labs in the current VM.
# This allows an update of the labs without distributing a new VM

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression (New-Object Net.Webclient).downloadstring("https://joswr1ght.github.io/update-labs/sec504/update-labs-e01.ps1")

#Write-Host -NoNewLine 'Press any key to continue...';
#$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

