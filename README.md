
# Terminal configuration

Bash and Vim dotfiles.

Symlink all relevant files to `~` or use the `Install.sh` script. For Vim, plugins are only enabled
and configured when [Plug](https://github.com/junegunn/vim-plug) is installed to remove any issues
when using it minimally. It decides whether or not to enable it based on the presence of a file at
`~/.vim/autoload/plug.vim`.

Vim's configuration isn't that minimalistic anymore (though the UI is).
