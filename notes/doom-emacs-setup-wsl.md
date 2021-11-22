# Setting up Doom Emacs on Windows / WSL

I followed [this](https://ethanaa.com/blog/switching-to-doom-emacs/#activate-wsl-and-install-ubuntu-18-04-lts) tutorial to set up Doom Emacs on my Ubuntu instance on WSL.

I'll document it again here because I needed to make some changes during the install to make it work on my machine and I don't want to forget anything in case I want to install it on another machine.

First install Ubuntu WSL from the Microsoft Store and run ```sudo apt update && sudo apt upgrade```.

Then I installed Emacs 27 using these commands:

```
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs27
```

Then I installed Doom Emacs:

```
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

~/.emacs.d/bin/doom sync
```

Afterwards we can run ```doom doctor``` to check if something is missing. In my case, I needed to install ```fd```, ```shellcheck``` and ```marked```.

```
sudo apt install fd-find
sudo apt install shellcheck
```

For marked, I had to use ```npm``` to install it. I ran into some issues so I had to clean the npm cache and then change to the latest ```node``` version:

```
sudo npm cache clean -f
sudo npm install -g n
sudo n latest
sudo npm install -g marked
```

Now Doom Emacs should be installed correctly.

## Setting up the graphical version using VcXsrv

I followed [this](https://github.com/hubisan/emacs-wsl#install-windows-x-server-vcxsrv) tutorial to set up the graphical version of Doom Emacs.

This tutorial used some .bat files to automatically set up the Firewall rules needed to get it to work using WSL2. I uploaded a personal copy of these bat files to a private GitHub repo as a backup.

First I installed the [VcXsrv](https://sourceforge.net/projects/vcxsrv/) program. The config file for it is also in my dotfiles repository. When it starts for the first time, there will be a Firewall popup - this needs to be allowed for private and public networks.

In the setup of ```VcXsrv`` ` I also set the ```-ac``` flag. This is **necessary** for it to work under WSL2.

## Setting up the correct firewall rules using the .bat files

Here are all the .bat files I ran (with admin rights):

* I ran the ```./run-emacs-wsl-2/wsl-2_0-run-all.bat```
* then ```./run-emacs-wsl-2/wsl-2_3-vcxsrv.bat```
* then ```./run-emacs-wsl-2/wsl-2_4-emacs.bat```

To be honest - I'm not completely sure if all of these need to be executed, I'll have to try it out again when I do this whole process the next time.

### Updating the .bashrc file to create an alias

In order to actually run the graphical version now, we need to update the ```.bashrc``` file and add the alias that is used to start Doom Emacs with the correct settings for the graphical version:

I added this to the file:
```
alias ema="
export DISPLAY=$(ip route | awk '/^default/{print $3; exit}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
setxkbmap -layout de
setsid emacs
"
```

Now it should be possible to start Doom emacs using the ```ema``` command.