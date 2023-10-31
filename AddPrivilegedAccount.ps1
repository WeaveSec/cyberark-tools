#
# Add_Privileged_Account_To_CyberArk.ps1
#

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

# Define the URL of the API endpoint
$url = "https://192.168.1.203/PasswordVault/API/auth/LDAP/Logon/"

# Define the JSON body
$jsonBody = @{
    "username"="luke"
    "password"="CrazyCats1!"
} | ConvertTo-Json

# Send the POST request
$response = Invoke-RestMethod -Uri $url -Method Post -Body $jsonBody -ContentType "application/json"

# Output the response
Write-Output $response

# Get All Safes
#$get_all_safes_url = "https://192.168.1.203/PasswordVault/API/Safes/"
#
#$logonHeader =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
#$logonHeader.Add("Authorization", $response)
#
#$get_all_safes_response = Invoke-RestMethod -Uri $get_all_safes_url -Headers $logonHeader -ContentType "application/json" -Method Get | Format-List
#
#
#Write-Output $get_all_safes_response

# Get all Accounts
#$get_all_accounts_url = "https://192.168.1.203/PasswordVault/API/Accounts/"
#
#$logonHeader =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
#$logonHeader.Add("Authorization", $response)
#
#$get_all_accounts_response = Invoke-RestMethod -Uri $get_all_accounts_url -Headers $logonHeader -ContentType "application/json" -Method GET | Format-List
#
#Write-Output $get_all_accounts_response

# Create New Safe
$create_new_safe_url = "https://192.168.1.203/PasswordVault/API/Safes/"

$logonHeader =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$logonHeader.Add("Authorization", $response)

$json_new_safe_Body = @{
  "managingCPM"= "passwordManager"
  "safeName"= "TestSafe1"
} | ConvertTo-Json

$create_new_safe_response = Invoke-RestMethod -Uri $create_new_safe_url  -Headers $logonHeader -Method Post -Body $json_new_safe_Body   -ContentType "application/json" | Format-List

Write-Output $create_new_safe_response
