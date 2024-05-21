# Set Execution Policy to Bypass
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Define the path
$path = "C:\Program Files (x86)\Sophos\Connect\import"

# Check if the path exists, if not, create it
if (-not (Test-Path -Path $path)) {
    New-Item -ItemType Directory -Path $path -Force
    Write-Output "Directory created: $path"
} else {
    Write-Output "Directory already exists: $path"
}

# Define the URL of the file to download and the destination file path
$fileUrl = "https://raw.githubusercontent.com/farnworthz-tqt/IntuneScriptedStore/main/sslvpnconfig.ovpn"
$destinationFile = "$path\sslvpnconfig.ovpn"

# Download the file
try {
    Invoke-WebRequest -Uri $fileUrl -OutFile $destinationFile
    Write-Output "File downloaded successfully to: $destinationFile"
} catch {
    Write-Error "Failed to download file: $_"
}
