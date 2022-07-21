# Setup variables
$Date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$CurrentDir = Get-Location
$DotfileDir = Join-Path -Path ${PSScriptRoot} -ChildPath "dotfiles"
$BackupDir = Join-Path -Path ${PSScriptRoot} -ChildPath "backups\${Date}"

# Create a backup directory
[System.IO.Directory]::CreateDirectory(${BackupDir})

# Loop through each dotfile
Foreach($file in Get-ChildItem $DotfileDir)
{
    $fileFullName = $file.FullName
    $fileName = $file.Name
    $dotfileFullName = (Join-Path -Path "${HOME}" -ChildPath ".${fileName}")

    # Backup current dotfile if it exists
    If (Test-Path -Path "${dotfileFullName}")
    {
        Copy-Item "$dotfileFullName" -Destination (Join-Path -Path "${BackupDir}" -ChildPath "${fileName}")
    }

    # Install the dotfile
    Copy-Item "${fileFullName}" -Destination "${dotfileFullName}"
}
