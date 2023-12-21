if (!(Get-Command "oh-my-posh" -errorAction SilentlyContinue))
{
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://ohmyposh.dev/install.ps1"))
    (Get-Command oh-my-posh).Source
}