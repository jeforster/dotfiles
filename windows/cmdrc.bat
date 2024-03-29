@echo off

:: Stop the title bar from showing this filename on startup
title Command Prompt

:: Prompt
prompt [$E[0m$E[33m%username%$E[0m] [$E[0m$E[35m%computername%$E[0m] [$E[0m$E[34m$P$E[0m]$_-$G

:: **** Aliases ****

:: Navigation aliases
DOSKEY ..=cd ..
DOSKEY ...=cd ..\..
DOSKEY ....=cd ..\..\..
DOSKEY .....=cd ..\..\..\..
DOSKEY ......=cd ..\..\..\..\..

:: General aliases
DOSKEY cat=type
DOSKEY clear=cls
DOSKEY curl=bitsadmin
DOSKEY date=time
DOSKEY diff=fc
DOSKEY env=set
DOSKEY grep=find
DOSKEY less=more
DOSKEY man=help
DOSKEY mkdir=md
DOSKEY mv=move
DOSKEY ps=tasklist
DOSKEY pwd=cd
DOSKEY rm=del
DOSKEY top=mem
DOSKEY wget=bitsadmin
DOSKEY which=where

:: ls aliases
DOSKEY ls=dir /b
DOSKEY lsa=dir /b /a
DOSKEY lsl=dir
DOSKEY lsla=dir /a

:: Git aliases
DOSKEY g=git
DOSKEY ga=git add
DOSKEY gaa=git add --all
DOSKEY gb=git branch
DOSKEY gbd=git branch --delete
DOSKEY gbm=git branch --move
DOSKEY gba=git branch --all
DOSKEY gco=git checkout
DOSKEY gcob=git checkout -b
DOSKEY gcom=git checkout main
DOSKEY gcot=git checkout --track
DOSKEY gcl=git clone
DOSKEY gci=git commit
DOSKEY gcim=git commit --message
DOSKEY gciam=git commit --all --message
DOSKEY gd=git diff
DOSKEY gdc=git diff --cached
DOSKEY gf=git fetch
DOSKEY gfa=git fetch --all --prune
DOSKEY gfo=git fetch origin
DOSKEY gi=git init
DOSKEY gls=git ls-files
DOSKEY glog=git log
DOSKEY glg=git log --graph --date=human
DOSKEY glgo=git log --graph --date=human --pretty=lo
DOSKEY glgt=git log --graph --date=human --pretty=lt
DOSKEY glgf=git log --graph --date=human --pretty=lf
DOSKEY glga=git log --graph --date=human --all
DOSKEY glgao=git log --graph --date=human --all --pretty=lo
DOSKEY glgat=git log --graph --date=human --all --pretty=lt
DOSKEY glgaf=git log --graph --date=human --all --pretty=lf
DOSKEY gm=git merge
DOSKEY gma=git merge --abort
DOSKEY gmc=git merge --continue
DOSKEY gms=git merge --skip
DOSKEY gmm=git merge main
DOSKEY gps=git push
DOSKEY gpso=git push origin
DOSKEY gpsoh=git push origin HEAD
DOSKEY gpl=git pull
DOSKEY gr=git remote
DOSKEY gra=git remote add
DOSKEY grmv=git remote rename
DOSKEY grrm=git remote remove
DOSKEY grgu=git remote get-url
DOSKEY grsu=git remote set-url
DOSKEY grv=git remote --verbose
DOSKEY grb=git rebase
DOSKEY grba=git rebase --abort
DOSKEY grbc=git rebase --continue
DOSKEY grbi=git rebase --interactive
DOSKEY grbs=git rebase --skip
DOSKEY grbm=git rebase main
DOSKEY grl=git reflog --pretty=rlf
DOSKEY grlo=git reflog --pretty=rlo
DOSKEY grlt=git reflog --pretty=rlt
DOSKEY grlf=git reflog --pretty=rlf
DOSKEY gre=git reset
DOSKEY greh=git reset --hard
DOSKEY grem=git reset --mixed
DOSKEY gres=git reset --soft
DOSKEY grehh=git reset --hard HEAD
DOSKEY gremh=git reset --mixed HEAD
DOSKEY gresh=git reset --soft HEAD
DOSKEY grehom=git reset --hard origin/main
DOSKEY gst=git status
DOSKEY gsti=git status --ignored
DOSKEY gstu=git status --untracked-files
DOSKEY gstiu=git status --ignored --untracked-files
DOSKEY gsa=git stash -all
DOSKEY gsl=git stash list
DOSKEY gslo=git stash list --pretty=rlo
DOSKEY gslt=git stash list --pretty=rlf
DOSKEY gslf=git stash list --pretty=rlf
DOSKEY gt=git tag
DOSKEY gt=git tag --delete
DOSKEY galiases=git config --get-regexp ^alias
DOSKEY gnuke=git nuke
DOSKEY gwhoami=git whoami

:: clink setup
IF EXIST "%programfiles(x86)%\clink\clink.bat" ( 
  "%programfiles(x86)%\clink\clink.bat" inject --autorun --profile ~\clink --quiet
)