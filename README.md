# Jeff’s dotfiles

## Installation

**Note:** I would recommend forking this repository and updating my dotfiles or replacing them with your own.

### Mac/Linux

Open a terminal window, and use the below commands to clone and open the repository:

```bash
git clone https://github.com/jeforster/dotfiles.git
cd dotfiles
```

Then, install the dotfiles with:

```bash
./install.sh
```

### Windows

Open a powershell window, and use the below commands to clone and open the repository:

```
git clone https://github.com/jeforster/dotfiles.git
Set-Location dotfiles
```

Install the dotfiles with:

```
.\install.ps1
```

This will backup existing dotfiles into a `backups` folder and install all files in the `dotfiles` folder.  

## Update

If you need to update existing dotfiles, just pull this repository and the changes should take effect automatically on Mac/Linux.  Windows will require you to re-run the install script.

If you want to pull or add a new file, add it to the dotfiles folder and re-run the install script.

## Notes

* Windows specific dotfiles should be places inside the `windows` directory instead of the standard `dotfiles` directory.
* The profile for PowerShell should be placed inside `powershell\profile.ps1`.  This file is installed for both PowerShell [Core] (`pwsh.exe`) and Windows Powershell (`powershell.exe`).

## Customizations

You can overwrite any settings and put specific local configs in:

* `~/.aliases.local`
* `~/.bash_profile.local`
* `~/.bashrc.local`
* `~/.exports.local`
* `~/.functions.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.zshrc.local`

For example your `~/.gitconfig.local` might look like this:

```
[user]
  name = Jeff Forster
  email = jeff@example.com
```