#!/bin/bash
#
# Backs up existing dotfiles and replaces them with symlinks to files in the dotfiles directory

# Get the directories needed
get_directories() {
  current_directory=$( pwd )
  script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  dotfile_directory="$script_directory"/dotfiles
  backup_directory="$script_directory"/backups/$( date +%Y-%m-%d_%H-%M-%S )
}

# Create the backup directory using the current date and time
create_backup_directory() {
  echo -n "Creating $backup_directory for backups..."
  mkdir -p $backup_directory
}

# check if the dotfile exists and move it to the $backup_directory
# Arguments:
#   dotfile_name
backup_dotfile() {
  dotfile_name=$1
  if [ -f ~/.$dotfile_name ]; then
    echo -n "Backing up existing file..."
    mv ~/.$dotfile_name $backup_directory/$dotfile_name
    echo "done"
  fi
}

# create the dotfile symlink
# Arguments:
#   dotfile_name
link_dotfile() {
  dotfile_name=$1
  echo -n "creating a new symlink..."
  ln -s $dotfile_name ~/.$dotfile_name
  echo "done"
}

# create a backup and symlink for a given dotfile
# Arguments:
#   dotfile
backup_and_link_dotfile() {
  dotfile=$1

  # remove the path to get just the file name
  dotfile_name=$( basename $dotfile )

  echo -e "installing \e[34m~/.$dotfile_name\e[0m"

  backup_dotfile $dotfile_name
  link_dotfile $dotfile_name

  echo
}

# backup and create symlinks for all dotfiles in the $dotfile_directory
backup_and_link_all_dotfiles() {
    
  create_backup_directory

  for dotfile in *; do
    backup_and_link_dotfile $dotfile
  done
}

main() {
  get_directories
  cd $dotfile_directory
  backup_and_link_all_dotfiles
  cd $current_directory
}

main "$@"