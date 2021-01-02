# Linux Dot Files

## Getting Started
Solution from [here](https://www.atlassian.com/git/tutorials/dotfiles).
Copied below for future reference in-case of stale link.

### Uploading

1. Create the config folder in the home direction and initialise as a bare Git repository.
`git init --bare $HOME/.cfg`

2. Create an alias to interact specifically with the config repo.
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

3. Disable 'Show Untracked Files' as there will be lots in the home directory.
`config config --local status.showUntrackedFiles no`

4. Add the config alias to the bash config for permanent use.
`echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc`

### Downloading

1. Ensure the alias is present in the bash configuration. If not add with below;
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

2. Ensure that the repositories clone folder is ignored in Git.
`echo ".cfg" >> .gitignore`

3. Clone the repository.
`git clone --bare git@github.com:TomPlum/linux-dotfiles.git $HOME/.cfg`

4. Define the config alias in the current shell scope.
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

5. Checkout the content from the repository (ensure on correct distro branch)
`config checkout`

6. Disable 'Show Untracked Files' as there will be lots in the home directory.
`config config --local status.showUntrackedFiles no`
