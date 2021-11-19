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

By pressing ```Spacebar``` I can get to an overview of the available commands. Then I just press whatever button is mapped to the command or menu I need. I can also just run commands directly. If I want to run a command like for example ```doom/restart-and-restore``` in order to restart and load a new config, here is what I need to do: 

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

### Quickly opening new emacs window or terminal

By pressing ```Space + o``` I can get to a menu that lets me quickly **open the eshell terminal**** by pressing ```e``` or open a new emacs window by pressing ```f```. 

### Running commands specific to the currently open file

I'm not sure exactly how this works / what this is called, but by pressing ```Control + c```, I get to a menu that shows me commands specific to the currently open file.

For example, if I have a markdown file open, it will show me useful commands for markdown files such as adding a todo item.

**TODO**

* [ ] Figure out why FiraCode doesn't seem to work correctly 

* [ ] Try setting up Doom Emacs on Windows using WSL - installing it with chocolatey had some errors with ligatures that I wasn't able to resolve. Try installing it using this tutorial:  [https://ethanaa.com/blog/switching-to-doom-emacs/#install-doom-emacs](https://ethanaa.com/blog/switching-to-doom-emacs/#install-doom-emacs)
