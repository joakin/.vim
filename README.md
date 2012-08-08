
## Vim dotfiles

These are the vim config files that I use on a daily basis.

I'm using [Vundle](https://github.com/gmarik/vundle) to manage the all the
plugins, and I keep all the .vim folder in here, to have some extra runtime
files (tabular patterns, custom snippets, etc).

## Usage

**NOTE**: If you have existing files in `$HOME/.vim` or `$HOME/.vimrc`, make
sure you take appropriate backups and take them out of the way before
performing any of the following steps.

 - First, clone this repo (Creates ~/.vim)

```sh
$ git clone git@github.com:joakin/.vim.git ~/.vim
```

 - Then install Vundle, as per their [instructions](https://github.com/gmarik/vundle):

```sh
$ mkdir ~/.vim/bundle
$ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

 - Next, symlink the `.vimrc` to your `$HOME/.vimrc`:

```sh
$ ln -s ~/.vim/.vimrc ~/.vimrc
```

 - Finally, we need to launch Vim and then invoke the appropriate Vundle
   commands to install all of the bundles using the `:BundleInstall` command.

And that's it! Be sure to source your newly installed configuration (`:source
$MYVIMRC` from inside Vim, or just restart a new editor session), and you
should be good to go.

## Caveats

### Windows

In windows, to automate the instructions be sure to use `vimfiles` instead of
`.vim` as folder name. This way, gvim will pick them up properly. Also, instead
of the symlink, just create a `_vimrc` and inside it just `source
~/vimfiles/.vimrc`.

### Terminal vim

There are certain issues with the terminal vim. I'm working on it :s

