$serviceName = "elmeeeko-ai-search"
$apiVersion = "2024-07-01"
$indexJsonPath = ".\index.json"
$indexName = "test10"
$body = Get-Content $indexJsonPath | ConvertFrom-Json | ConvertTo-Json -Compress -Depth 10
$url = "https://${serviceName}.search.windows.net/indexes('${indexName}')?api-version=${apiVersion}"
$tokenRequest = az account get-access-token --scope https://search.azure.com/.default | ConvertFrom-Json

Invoke-RestMethod -Method PUT `
    -Uri $url `
    -Body $body `
    -Authentication Bearer `
    -Token $(ConvertTo-SecureString -AsPlainText -Force $tokenRequest.accessToken) `
    -ContentType application/json
