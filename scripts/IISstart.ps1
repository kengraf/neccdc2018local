#!powershell

# Turn on IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Turn on File server
Install-WindowsFeature File-Services

# Turn on Remote desktop

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0 -PropertyType dword -Force
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'UserAuthentication' -Value 1 -PropertyType dword -Force
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

md E:\Groupdata
icacls E:\Groupdata /grant "Authenticated Users":(OI)(CI)(M)

New-SmbShare -Name Groupdata -Path E:\Groupdata -FolderEnumerationMode AccessBased -CachingMode Documents -EncryptData $True -FullAccess Everyone 




