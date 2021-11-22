# Doom Emacs

## Installation
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