# DotFiles
Contains the configuration files for various editors I use like VSCode and VIM.

* [Neovim](https://github.com/bbsaurav/DotFiles/blob/master/vim/nvim)
* [Bash](https://github.com/bbsaurav/DotFiles/blob/master/bash/bashrc)
* [Zsh](https://github.com/bbsaurav/DotFiles/blob/master/zsh/zshrc)
* [VSCode](https://github.com/bbsaurav/DotFiles/blob/master/vscode)

##### Using different Identity file for accessing different github profiles
Generate a private/public identity file uisng `ssh-keygen`.
Add below to the ssh config.
```
Host github.com-bbsaurav
  HostName github.com
  User git
  IdentitiesOnly yes
  IdentityFile <Path to private identity file>
```
Now when cloning the project modify url by replacing `github.com` with `github.com-bbsaurav`.
```
$ git clone git@github.com-bbsaurav:bbsaurav/DotFiles.git
```