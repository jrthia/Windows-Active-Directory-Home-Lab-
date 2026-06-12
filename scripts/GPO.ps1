# Screen Lock Policy
New-GPO -Name "Screen-Lock-Policy" -Comment "Forces screen lock after 10 minutes of inactivity"
New-GPLink -Name "Screen-Lock-Policy" -Target "OU=Corporate-HQ,DC=lab,DC=local"
Set-GPRegistryValue -Name "Screen-Lock-Policy" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName "ScreenSaveTimeOut" -Type String -Value "600"
Set-GPRegistryValue -Name "Screen-Lock-Policy" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName "ScreenSaveActive" -Type String -Value "1"
Set-GPRegistryValue -Name "Screen-Lock-Policy" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName "ScreenSaverIsSecure" -Type String -Value "1"

# USB Restriction Policy
New-GPO -Name "USB-Restriction-Policy" -Comment "Prevents users from using USB storage devices"
New-GPLink -Name "USB-Restriction-Policy" -Target "OU=Corporate-HQ,DC=lab,DC=local"
Set-GPRegistryValue -Name "USB-Restriction-Policy" -Key "HKLM\System\CurrentControlSet\Services\USBSTOR" -ValueName "Start" -Type DWord -Value 4

# Restrict Control Panel
New-GPO -Name "Restrict-Control-Panel" -Comment "Prevents standard users from accessing Control Panel"
New-GPLink -Name "Restrict-Control-Panel" -Target "OU=Corporate-HQ,DC=lab,DC=local"
Set-GPRegistryValue -Name "Restrict-Control-Panel" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoControlPanel" -Type DWord -Value 1
