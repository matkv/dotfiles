# TODO clean / fix this README

Update: 23.10.2021 - maybe use [this](https://www.youtube.com/watch?v=tBoLDpTWVOM&t=829s) tutorial which uses a git bare repository? Or use something that uses symlinks in order to link the actual files and the files in the .dotfiles repository?

---

This is my first try of using a dotfiles repository. The dotfiles are managed by [GNU Stow](https://www.gnu.org/software/stow/).

At the moment this repository does not yet contain all my dotfiles - this is a work in progress.

## Setup process

With `brew` installed, run `sudo pacman -S stow` (for manjaro).

## Example usage

Let's say this repository is in the home directory (`~/dotfiles`) and we want to move the git configuration file `.gitconfig` to this repository.

```
mv ~/.gitconfig ~/dotfiles/git
```

Now the `.gitconfig` file is in `$HOME/dotfiles/git/.gitconfig`. We need to use `stow` to install it. From **inside** the `$HOME/dotfiles/` directory, we run this:

```
stow -v -R -t ~ git
``` 

Now the file is back in the home directory and has been **symlinked** to the one in the dotfiles directory.

```
lrwxrwxrwx   1 matko matko    23  3. Jul 23:11 .gitconfig -> dotfiles/git/.gitconfig
```

If I would want to use this on a new computer, I just need to clone this repository, install stow and run the `stow -v -R -t ~ git` command inside my dotfiles directory and it would would automatically create the `.gitconfig` (and all other files in the git folder) inside my home directory.
