# How my vim config file created

1. General

参考:http://edyfox.codecarver.org/html/vim_fileencodings_detection.html
set encoding=utf-8

Install Pathogen.vim
  download the script and place it in your .vim/autoload directory.
     http://www.vim.org/scripts/script.php?script_id=2332 
  add the following line to your .vimrc file:
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()
  It is essential that these line are called before enabling filetype detection, so putting them at the top of your vimrc file is recommended.

Install Plugins as submodules
  git submodules: It's designed expecially for the purpose of keeping git repositories
  within a git repository.

  -For example to install the fugitive plugin as a git submodule,take the following steps:
    ----start
    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/**/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install fugitive.vim bundle as a submodule."
    ----end

Install your Vim environment on another machine
    按照前面的操作，现在可以在另一台机器上同步你的VIM设置.
      cd ~
      git clone http://github.com/username/dotvim.git ~/.vim
      ln -s ~/.vim/vimrc ~/.vimrc
      ln -s ~/.vim/gvimrc ~/.gvimrc
      git submodule init
      git submodule update
      "最后两行可以改为这样:git submodule update --init.

Upgrading a plugin bundle
  如果需要更新某个plugin，可以这么做:
    cd ~/.vim/bundle/fugitive
    git pull origin master

Upgrading all bundled plugins

    git submodule foreach git pull origin master


Installation:

    git clone git://github.com/saturnisbig/vimrc.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

上传本地文件到github上.
$ git remote add origin git@github.com:username/Hello-World.git
$ git push origin master
