# Platform specific config
if ($IsWindows)
{
    . "${HOME}\.config\powershell\platforms\windows.ps1"
}
elseif ($IsMacOS)
{
    . "${HOME}\.config\powershell\platforms\macos.ps1"
}
elseif ($IsLinux)
{
    . "${HOME}\.config\powershell\platforms\linux.ps1"
}

# Install modules
if (!(Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Repository PSGallery -Force
}
if (Get-Module -ListAvailable -Name PSReadLine) {
    $currentVersion = (Get-Module -ListAvailable -Name PSReadLine).Version
    if ($currentVersion -lt [Version]"2.2.6") {
        Update-Module -Name PSReadLine -Force
    }
} else {
    Install-Module -Name PSReadLine -Force -MinimumVersion "2.2.6"
}

# Import modules
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

# PSReadline setup
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Theme
$themes = @("el_jefe", "bubbles")
$theme = $themes | Get-Random
oh-my-posh init pwsh --config "${HOME}\.config\powershell\themes\${theme}.omp.json" | Invoke-Expression

# Aliases
Set-Alias e emacs
Set-Alias g git
Set-Alias v vim
Set-Alias which get-command
Set-Alias grep findstr

# ls aliases
Remove-Item Alias:ls -ErrorAction SilentlyContinue
function global:ls() { Get-ChildItem @args | Format-Wide }
function global:lsa() { Get-ChildItem -Force @args | Format-Wide }
function global:lsl() { Get-ChildItem @args }
function global:lsla() { Get-ChildItem -Force @args }

# Easy movement
function global:..() { Set-Location .. }
function global:...() { Set-Location ..\.. }
function global:....() { Set-Location ..\..\.. }
function global:.....() { Set-Location ..\..\..\.. }
function global:......() { Set-Location ..\..\..\..\.. }

# Git aliases
function global:ga() { git add @args }
function global:gaa() { git add --all @args }
function global:gb() { git branch @args }
function global:gbd() { git branch --delete @args }
function global:gbm() { git branch --move @args }
function global:gba() { git branch --all @args }
function global:gco() { git checkout @args }
function global:gcob() { git checkout -b @args }
function global:gcom() { git checkout main @args }
function global:gcl() { git clone @args }
function global:gci() { git commit @args }
function global:gcim() { git commit --message @args }
function global:gciam() { git commit --all --message @args }
function global:gd() { git diff @args }
function global:gdc() { git diff --cached @args }
function global:gf() { git fetch @args }
function global:gfa() { git fetch --all --prune @args }
function global:gfo() { git fetch origin @args }
function global:gi() { git init @args }
function global:gls() { git ls-files @args }
function global:glog() { git log @args }
function global:glg() { git log --color --graph --date=human @args }
function global:glgo() { git log --color --graph --date=human --pretty=lo @args }
function global:glgt() { git log --color --graph --date=human --pretty=lt @args }
function global:glgf() { git log --color --graph --date=human --pretty=lf @args }
function global:glga() { git log --color --graph --date=human --all @args }
function global:glgao() { git log --color --graph --date=human --all --pretty=lo @args }
function global:glgat() { git log --color --graph --date=human --all --pretty=lt @args }
function global:glgaf() { git log --color --graph --date=human --all --pretty=lf @args }
function global:gm() { git merge @args }
function global:gma() { git merge --abort @args }
function global:gmc() { git merge --continue @args }
function global:gms() { git merge --skip @args }
function global:gmm() { git merge main @args }
function global:gps() { git push @args }
function global:gpso() { git push origin @args }
function global:gpsoh() { git push origin HEAD @args }
function global:gpl() { git pull @args }
function global:gr() { git remote @args }
function global:gra() { git remote add @args }
function global:grmv() { git remote rename @args }
function global:grrm() { git remote remove @args }
function global:grgu() { git remote get-url @args }
function global:grsu() { git remote set-url @args }
function global:grv() { git remote --verbose @args }
function global:grb() { git rebase @args }
function global:grba() { git rebase --abort @args }
function global:grbc() { git rebase --continue @args }
function global:grbi() { git rebase --interactive @args }
function global:grbs() { git rebase --skip @args }
function global:grbm() { git rebase main @args }
function global:grl() { git reflog --pretty=rlf @args }
function global:grlo() { git reflog --pretty=rlo @args }
function global:grlt() { git reflog --pretty=rlt @args }
function global:grlf() { git reflog --pretty=rlf @args }
function global:gre() { git reset @args }
function global:greh() { git reset --hard @args }
function global:grem() { git reset --mixed @args }
function global:gres() { git reset --soft @args }
function global:grehh() { git reset --hard HEAD @args }
function global:gremh() { git reset --mixed HEAD @args }
function global:gresh() { git reset --soft HEAD @args }
function global:grehom() { git reset --hard origin/main @args }
function global:gst() { git status @args }
function global:gsti() { git status --ignored @args }
function global:gstu() { git status --untracked-files @args }
function global:gstiu() { git status --ignored --untracked-files @args }
function global:gstall() { git stash -all @args }
function global:gt() { git tag @args }
function global:galiases() { git config -l | findstr alias | ForEach-object { $_.SubString(6) }}
function global:gnuke() { git reset --hard HEAD && git clean -fd }
function global:gwhoami() { Write-Output "$(git config --get user.name) <$(git config --get user.email)>" }
