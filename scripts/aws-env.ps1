param(
    [string]$Profile = "default",
    [string]$Region = "ap-northeast-2"
)

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$awsDir = Join-Path $repoRoot ".aws"
$credentialsFile = Join-Path $awsDir "credentials"
$configFile = Join-Path $awsDir "config"

if (-not (Test-Path $credentialsFile)) {
    throw "Missing local AWS credentials file: $credentialsFile"
}

$env:AWS_SHARED_CREDENTIALS_FILE = $credentialsFile
$env:AWS_CONFIG_FILE = $configFile
$env:AWS_PROFILE = $Profile
$env:AWS_DEFAULT_REGION = $Region
$env:AWS_REGION = $Region

Write-Host "AWS credentials file: $env:AWS_SHARED_CREDENTIALS_FILE"
Write-Host "AWS profile: $env:AWS_PROFILE"
Write-Host "AWS region: $env:AWS_DEFAULT_REGION"
