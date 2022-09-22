# Install modules
if (!(Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Repository PSGallery -Force
}
if (!(Get-Module -ListAvailable -Name PSReadLine)) {
    Install-Module -Name PSReadLine -AllowPrerelease -Force
}

# Import modules
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

# Oh-my-posh install & setup
if (!(Get-Command "oh-my-posh" -errorAction SilentlyContinue))
{
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://ohmyposh.dev/install.ps1"))
    (Get-Command oh-my-posh).Source
}
oh-my-posh init pwsh --config "${HOME}\.oh-my-posh\themes\el_jefe.omp.json" | Invoke-Expression

# PSReadline setup
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliases
Set-Alias e emacs
Set-Alias g git
Set-Alias v vim
Set-Alias which get-command
Set-Alias grep findstr

# ls aliases
Remove-Alias -Name ls -ErrorAction SilentlyContinue
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
function global:gbc() { git rev-parse --abbrev-ref HEAD @args }
function global:gco() { git checkout @args }
function global:gcob() { git checkout -b @args }
function global:gcom() { git checkout master @args }
function global:gcl() { git clone @args }
function global:gci() { git commit @args }
function global:gcim() { git commit -m @args }
function global:gciam() { git commit -am @args }
function global:gd() { git diff @args }
function global:gdc() { git diff --cached @args }
function global:gf() { git fetch @args }
function global:gfa() { git fetch --all --prune @args }
function global:gfo() { git fetch origin @args }
function global:gi() { git init @args }
function global:gls() { git ls-files @args }
function global:glog() { git log @args }
function global:glogs() { git log --stat @args }
function global:glogg() { git log --graph --decorate @args }
function global:glogo() { git log --graph --decorate --oneline @args }
function global:glg() { git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit @args }
function global:glga() { git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all @args }
function global:glgs() { git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --stat @args }
function global:gm() { git merge @args }
function global:gma() { git merge --abort @args }
function global:gmc() { git merge --continue @args }
function global:gms() { git merge --skip @args }
function global:gmm() { git merge master @args }
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
function global:grv() { git remote -v @args }
function global:grb() { git rebase @args }
function global:grba() { git rebase --abort @args }
function global:grbc() { git rebase --continue @args }
function global:grbi() { git rebase --interactive @args }
function global:grbs() { git rebase --skip @args }
function global:grbm() { git rebase master @args }
function global:gre() { git reset @args }
function global:greh() { git reset --hard @args }
function global:grem() { git reset --mixed @args }
function global:gres() { git reset --soft @args }
function global:grehh() { git reset --hard HEAD @args }
function global:gremh() { git reset --mixed HEAD @args }
function global:gresh() { git reset --soft HEAD @args }
function global:grehom() { git reset --hard origin/master @args }
function global:gst() { git status @args }
function global:gstall() { git stash -all @args }
function global:gt() { git tag @args }
function global:galiases() { git config -l | findstr alias | ForEach-object { $_.SubString(6) }}
