##Verification commands
#Domain 
Get-ADDomain | Select-Object DNSRoot, NetBIOSName, DomainMode
#OUs
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName
#Groups
Get-ADGroup -Filter * -SearchBase "OU=Corporate-HQ,DC=lab,DC=local" -Properties DistinguishedName | Select-Object Name, DistinguishedName | Sort-Object DistinguishedName
#Group Members
Get-ADGroupMember -Identity "Developers" | Select-Object Name, SamAccountName
Get-ADGroupMember -Identity "Finance-Approvers" | Select-Object Name, SamAccountName
Get-ADGroupMember -Identity "HR-Managers" | Select-Object Name, SamAccountName
Get-ADGroupMember -Identity "Helpdesk" | Select-Object Name, SamAccountName
#All Users
Get-ADUser -Filter * -SearchBase "OU=Corporate-HQ,DC=lab,DC=local" | Select-Object Name, SamAccountName, Enabled | Sort-Object Name
#Default Password Policy & Fine grained password policy
Get-ADDefaultDomainPasswordPolicy
Get-ADFineGrainedPasswordPolicy -Filter * | Select-Object Name, Precedence, MinPasswordLength, MaxPasswordAge, LockoutThreshold
#Fine grained password policy links
Get-ADFineGrainedPasswordPolicySubject -Identity "Finance-Policy"
Get-ADFineGrainedPasswordPolicySubject -Identity "HR-Policy"
Get-ADFineGrainedPasswordPolicySubject -Identity "IT-Policy"
#GPO
Get-GPO -All | Select-Object DisplayName, GpoStatus, CreationTime
Get-GPInheritance -Target "OU=Corporate-HQ,DC=lab,DC=local"
#Delegation 
$ou = "OU=HR,OU=Corporate-HQ,DC=lab,DC=local"
(Get-Acl -Path "AD:\$ou").Access | Where-Object {$_.IdentityReference -like "*Helpdesk*"} | Select-Object IdentityReference, ActiveDirectoryRights, AccessControlType
#Topology
Get-ADReplicationSite -Filter * | Select-Object Name
Get-ADReplicationSubnet -Filter * | Select-Object Name, Site
