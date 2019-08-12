# Jeff’s dotfiles

## Installation

**Note:** I would recommend forking this repository and updating my dotfiles or replacing them with your own.

Clone and open the repository:

```bash
git clone https://github.com/jeforster/dotfiles.git
cd dotfiles
```

Install the dotfiles:

```bash
./install.sh
```

This will backup existing dotfiles into a `backups` folder and create symlinks for all files in the `dotfiles` folder.  

## Update

If you need to update existing dotfiles, just pull this repository and the changes should take effect automatically.

If you want to pull or add a new file, add it to the dotfiles folder and re-run the `install.sh` script.

## Customizations

To add configurations that you don't want to commit put them into `~/.extras`