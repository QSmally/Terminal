
# Terminal configuration

Bash, Git, River, LaTeX and Vim dotfiles.

Symlink all relevant files to `~` or use the `Install.sh` script. For Vim, plugins are only enabled
and configured when [Plug](https://github.com/junegunn/vim-plug) is installed to remove any issues
when using it minimally. It decides whether or not to enable it based on the presence of a file at
`~/.vim/autoload/plug.vim`.

Vim's configuration isn't that minimalistic anymore (though the UI is). `Ack`, `curl`, `ctags`,
`docker`, `latexmk` and `xpdf` may be installed for a nice experience, as well as being compiled
with Python for Emacs org-mode support and Node for Markdown preview and JSON syntax correction.
Skim or Okular is used as VimTeX compiled document viewer. Tested with Vim 9 on Debian, FreeBSD
and macOS.
