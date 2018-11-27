all : zsh tmux vim
zsh :
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ln -s .zshrc ~/
	source ~/.zshrc

tmux :
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ln -s .tmux.conf ~/

vim :
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ln -s .vimrc ~/
