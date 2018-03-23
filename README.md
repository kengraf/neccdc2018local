# neccdc18blackteam
Config files, setup docs, Ansible playbooks for locally hosted systems


## PowerShell Remoting with Ansible
Run the following Commands on Windows 8+/2012+ to enable PS Remoting
```
PS> Enable-PSRemoting -Force -SkipNetworkProfileCheck
PS> Set-Item wsman:\localhost\Client\Trustedhosts *
PS> Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
PS> Set-Item -Path WSMan:\localhost\Service\Auth\Certificate -Value $true

C:\> winrm set winrm/config/client/auth @{Basic="true"}
C:\> winrm set winrm/config/service/auth @{Basic="true"}
C:\> winrm set winrm/config/service @{AllowUnencrypted="true"}
```
## SSH for Linux system
ssh-copy-id -i "blackteam-private" root@{{target-system}}

## Base deployment summary
10.1.X.1			Palo Alto 3050

10.1.X.11	Tintin		Windows 2012 based domain controller
10.1.X.12	Holmes		Windows 2016 server
10.1.X.13	Marple		Linux file server
10.1.X.14	Tracy		Linux Drupal server

10.1.X.15	Mulder		Windows 10 desktop
10.1.X.16	Clouseau	Windows 10 desktop
10.1.X.17	Gadget		Kali 2018.1
10.1.X.18	Payne		SANS SIFT workstation


