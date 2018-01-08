# My Vim Configuration
A work in Progress. Inspired by thunderboltsid's [vim-configuration](https://github.com/thunderboltsid/vim-configuration)

## Setup

First go to a directory where you would like to store this configuration and 
back up your current vim configuration stored in .vim and .vimrc files in your
home directory.

```
git clone https://github.com/martinjaime/MyVimConfig.git vim
```
Then create a symbolic link from the repository to .vim in your home directory.
Create a link for .vim and .vimrc files. I had cloned it in my Documents folder.

```
ln -s ~/Documents/vim ~/.vim
ln -s ~/Documents/vim/vimrc ~/.vimrc
```
Initiate and update submodules.

```
cd vim
git submodule init
git submodule update
```
Look through .vimrc and make sure you want all the plugins that are uncommented.
Keep in mind that installing [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) requires extra installation steps.

Open Vim and run the command `PluginInstall` to install all the plugins. If you
don't know how to do this, search for how to run colon commands in Vim.
