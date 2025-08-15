$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ($IsAdmin) {
    # Chocolatey install
    if (!(Get-Command "choco" -errorAction SilentlyContinue))
    {
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }

    # Oh-my-posh install
    if (!(Get-Command "oh-my-posh" -errorAction SilentlyContinue))
    {
        Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://ohmyposh.dev/install.ps1"))
        (Get-Command oh-my-posh).Source
    }

    # Remove old system versions of PSReadline
    $psReadlinePath = "${Env:Programfiles}\WindowsPowerShell\Modules\PSReadLine"
    if (Test-Path $psReadlinePath) {
        $folders = Get-ChildItem $psReadlinePath | Where-Object { $_.PSIsContainer }
        foreach ($folder in $folders) {
            $folderVersion = [Version]$folder.Name
            if ($folderVersion -and $folderVersion -lt [Version]"2.2.6") {
                Remove-Item $folder.FullName -Recurse -Force
            }
        }
    }
}

# Update Chocolatey and all packages
function global:chocoup() { 
    choco upgrade chocolatey
    choco upgrade all -y

    # Remove shortcuts from current user's desktop
    Remove-Item "$env:USERPROFILE\Desktop\*.lnk" -Force -ErrorAction SilentlyContinue

    # Remove shortcuts from OneDrive desktop
    Remove-Item -Path "$env:OneDrive\Desktop\*.lnk" -Force -ErrorAction SilentlyContinue

    # Remove shortcuts from public desktop
    Remove-Item "$env:PUBLIC\Desktop\*.lnk" -Force -ErrorAction SilentlyContinue

}