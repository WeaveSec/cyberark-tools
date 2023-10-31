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

# Define the headers (if necessary)
$headers = @{
    "Content-Type"="application/json"
}

# Send the POST request
$response = Invoke-RestMethod -Uri $url -Method Post -Body $jsonBody -Headers $headers

# Output the response
Write-Output $response


#$get_all_safes_url = "https://192.168.1.203/PasswordVault/API/Safes/"
#
#$logonHeader =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
#$logonHeader.Add("Authorization", $response)
#
#$get_all_safes_response = Invoke-RestMethod -Uri $get_all_safes_url -Headers $logonHeader -ContentType "application/json" -Method GET | Format-List
#
#
#Write-Output $get_all_safes_response

$get_all_accounts_url = "https://192.168.1.203/PasswordVault/API/Accounts/"

$logonHeader =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$logonHeader.Add("Authorization", $response)

$get_all_accounts_response = Invoke-RestMethod -Uri $get_all_accounts_url -Headers $logonHeader -ContentType "application/json" -Method GET | Format-List

Write-Output $get_all_accounts_response




