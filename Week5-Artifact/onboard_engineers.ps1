Write-Host "[*] Beginning Engineering Onboarding..."

1..5 | ForEach-Object {
New-ADUser -Name "Eng_User$_" -Path "OU=Engineering,DC=titan,DC=local" -ChangePasswordAtLogon $true -Enabled $true -AccountPassword (ConvertTo-SecureString "TempPass123!" -AsPlainText -Force)
}

Write-Host "[+] All engineers onboarded successfully."