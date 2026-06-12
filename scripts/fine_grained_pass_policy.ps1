# Finance-Policy — strictest, 30 day expiry
New-ADFineGrainedPasswordPolicy -Name "Finance-Policy" -Precedence 10 -MinPasswordLength 16 -PasswordHistoryCount 24 -MaxPasswordAge "30.00:00:00" -MinPasswordAge "1.00:00:00" -LockoutThreshold 3 -LockoutDuration "00:30:00" -LockoutObservationWindow "00:30:00" -ComplexityEnabled $true -ReversibleEncryptionEnabled $false

# IT-Policy — medium, 60 day expiry
New-ADFineGrainedPasswordPolicy -Name "IT-Policy" -Precedence 15 -MinPasswordLength 16 -PasswordHistoryCount 24 -MaxPasswordAge "60.00:00:00" -MinPasswordAge "1.00:00:00" -LockoutThreshold 3 -LockoutDuration "00:30:00" -LockoutObservationWindow "00:30:00" -ComplexityEnabled $true -ReversibleEncryptionEnabled $false

# HR-Policy — medium, 45 day expiry
New-ADFineGrainedPasswordPolicy -Name "HR-Policy" -Precedence 20 -MinPasswordLength 16 -PasswordHistoryCount 24 -MaxPasswordAge "45.00:00:00" -MinPasswordAge "1.00:00:00" -LockoutThreshold 3 -LockoutDuration "00:30:00" -LockoutObservationWindow "00:30:00" -ComplexityEnabled $true -ReversibleEncryptionEnabled $false

# Link policies to groups
Add-ADFineGrainedPasswordPolicySubject -Identity "Finance-Policy" -Subjects "Finance-Approvers"
Add-ADFineGrainedPasswordPolicySubject -Identity "IT-Policy" -Subjects "Developers"
Add-ADFineGrainedPasswordPolicySubject -Identity "HR-Policy" -Subjects "HR-Managers"
