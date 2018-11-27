current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all : zsh tmux vim

zsh :
	sh -c "$(shell curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	if [ -f ~/.zshrc ]; then  mv ~/.zshrc ~/.zshrc.bak; fi;
	ln -s "$(current_dir)/.zshrc" ~
	source ~/.zshrc

tmux :
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	if [ -f ~/.tmux.conf ]; then  mv ~/.tmux.conf ~/.tmux.conf.bak; fi;
	ln -s "$(current_dir)/.tmux.conf" ~
	ln -s "$(current_dir)/tmux-theme" ~/.tmux/

vim :
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	if [ -f ~/.vimrc ]; then  mv ~/.vimrc ~/.vimrc.bak; fi;
	ln -s "$(current_dir)/.vimrc" ~
