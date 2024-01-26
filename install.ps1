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
[System.IO.Directory]::CreateDirectory(${BackupDir}) | Out-Null

# Loop through each primary dotfile
Foreach($file in Get-ChildItem -Path $DotfileDir,$WindowsDotfileDir)
{
    $fileFullName = $file.FullName
    $fileName = $file.Name
    $dotfileFullName = (Join-Path -Path "${HOME}" -ChildPath ".${fileName}")

    # Backup current dotfile if it exists
    If (Test-Path -Path "${dotfileFullName}")
    {
        Move-Item "${dotfileFullName}" -Destination (Join-Path -Path "${BackupDir}" -ChildPath "${fileName}")
    }

    # Install the dotfile
    Copy-Item "${fileFullName}" -Destination "${dotfileFullName}" -Recurse

    # Hide the dotfile
    $dotfileObject = Get-Item $dotfileFullName
    $dotfileObject.Attributes = $dotfileObject.Attributes -bor [System.IO.FileAttributes]::Hidden

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

# Command prompt autorun cmdrc.bat
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /d "%userprofile%\.cmdrc.bat" /t REG_SZ /f

# Install the new Powershell profile
Copy-Item "${NewProfile}" -Destination "${PowerShellProfile}"
Copy-Item "${NewProfile}" -Destination "${PwshProfile}"