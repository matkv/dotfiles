# dotfiles
## Doom Emacs

### Installation
[Installation & Prerequisities](https://github.com/hlissner/doom-emacs#install)

```
# required dependencies
pacman -S git emacs ripgrep
# optional dependencies
pacman -S fd
```

Install Doom Emacs

```
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

I had to delete the already existing ```.emacs.d``` folder because it wouldn't let me run the clone command.

I then updated my .bashrc file in order to run the ```doom``` command anywhere. **Don't copy paste this command because the quotation marks won't be read correctly**.

```
export PATH=”$HOME/.emacs.d/bin:$PATH”
```


Then run ```doom doctor``` to see if anything is still wrong. 

In my case, the ```shellcheck``` package was missing so I just installed it with ```sudo pacman -S shellcheck```.

I also copied the files from the ```~./doom.d/``` folder to my dotfiles folder and symlinked them back to the original folder so I can use them here in GitHub (but I'm still looking for a better solution to managing my dotfiles).

### Configuration

In general, when using Doom Emacs, only the config files in ```~/.doom.d/``` should be used, not the normal Emacs config files.

* config.el - configuration
* init.el - specifies what is loaded when Doom Emacs starts, which Doom modules are enabled
* packages.el - packages/plugins that should be installed

Generally we don't need to mess with the ```init.el``` file, except when it comes to **uncommenting** lines that are commented out in order to enable some modules.

### Running commands

By pressing ```Shift``` and then ```Spacebar``` I can get to an overview of the available commands. If I want to run a command like for example ```doom/restart-and-restore``` in order to restart and load a new config, here is what I need to do. 

I can use the **meta key + x**, so I would press ```Alt``` and then ```x```, and then just start typing the command and Doom Emacs will start autocompleting it for me and I just run it by pressing enter.

It is also possible to try out themes this way by running the ```load-theme``` command or setting one with the ```set-theme``` command. (Or setting the theme in the config.el) file.

In order to load the new config and my changes, I need to run ```doom sync``` in the terminal. This will reload the config and install all the new packages/plugins.

### Installing packages in packages.el

In order to install a package (a plugin) that was not included originally in Doom Emacs, we use the ```packages.el``` file.

To install a package:

``` emacs-lisp
(package! name-of-plugin)
```

### Tools
#### Markdown-preview

When editing a markdown file, I can preview how the file will look by running the command ```markdown-preview``` or even quicker by pressing ```SPC m p``` (Shift + spacebar, then m, then p) and a preview of the markdown file will open in the default browser.

**TODO:** Try enabling LSP support for the languages that I use the most - this means that autocompletion and syntax errors and things like that should work just the way they do in VSCode for example. 

---
---
---

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
