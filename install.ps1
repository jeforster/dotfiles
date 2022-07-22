# Setup variables
$Date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$BackupDir = Join-Path -Path "${PSScriptRoot}" -ChildPath "backups\${Date}"
$DotfileDir = Join-Path -Path "${PSScriptRoot}" -ChildPath "dotfiles"
$WindowsDotfileDir = Join-Path -Path "${PSScriptRoot}" -ChildPath "windows"
$NewProfile = Join-Path -Path "${PSScriptRoot}" -ChildPath "powershell\profile.ps1"
$MyDocumentsDir = [environment]::getfolderpath("mydocuments")
$PowerShellProfile = Join-Path -Path "${MyDocumentsDir}" -ChildPath "WindowsPowerShell\profile.ps1"
$PwshProfile = Join-Path -Path "${MyDocumentsDir}" -ChildPath "PowerShell\profile.ps1"

# Create a backup directory
[System.IO.Directory]::CreateDirectory(${BackupDir})

# Loop through each primary dotfile
Foreach($file in Get-ChildItem $DotfileDir)
{
    $fileFullName = $file.FullName
    $fileName = $file.Name
    $dotfileFullName = (Join-Path -Path "${HOME}" -ChildPath ".${fileName}")

    # Backup current dotfile if it exists
    If (Test-Path -Path "${dotfileFullName}")
    {
        Move-Item "$dotfileFullName" -Destination (Join-Path -Path "${BackupDir}" -ChildPath "${fileName}")
    }

    # Install the dotfile
    Copy-Item "${fileFullName}" -Destination "${dotfileFullName}" -Recurse
}

# Loop through each Windows specific dotfile
Foreach($file in Get-ChildItem $WindowsDotfileDir)
{
    $fileFullName = $file.FullName
    $fileName = $file.Name
    $dotfileFullName = (Join-Path -Path "${HOME}" -ChildPath ".${fileName}")

    # Backup current dotfile if it exists
    If (Test-Path -Path "${dotfileFullName}")
    {
        Move-Item "$dotfileFullName" -Destination (Join-Path -Path "${BackupDir}" -ChildPath "windows\${fileName}")
    }

    # Install the dotfile
    Copy-Item "${fileFullName}" -Destination "${dotfileFullName}" -Recurse
}

# Backup PowerShell profiles
If (Test-Path -Path "${PowerShellProfile}")
{
    Move-Item "${PowerShellProfile}" -Destination (Join-Path -Path "${BackupDir}" -ChildPath "powershell_profile.ps1")
}
If (Test-Path -Path "${PwshProfile}")
{
    Move-Item "${PwshProfile}" -Destination (Join-Path -Path "${BackupDir}" -ChildPath "pwsh_profile.ps1")
}

# Install the new Powershell profile
Copy-Item "${NewProfile}" -Destination "${PowerShellProfile}"
Copy-Item "${NewProfile}" -Destination "${PwshProfile}"