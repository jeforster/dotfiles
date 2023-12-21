$env:PATH += ':/opt/homebrew/bin'

# Install homebrew if not already
if (!(Get-Command "brew" -errorAction SilentlyContinue))
{
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Install oh-my-posh if not already
if (!(Get-Command "oh-my-posh" -errorAction SilentlyContinue))
{
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
}