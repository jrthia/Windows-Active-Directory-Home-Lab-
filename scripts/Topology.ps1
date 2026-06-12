# Create sites
New-ADReplicationSite -Name "Dublin-HQ"
New-ADReplicationSite -Name "Galway-Branch"

# Create subnets
New-ADReplicationSubnet -Name "192.168.64.0/24" -Site "Dublin-HQ" -Description "Dublin HQ network"
New-ADReplicationSubnet -Name "10.10.1.0/24" -Site "Galway-Branch" -Description "Galway Branch network"
