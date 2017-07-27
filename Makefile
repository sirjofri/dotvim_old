.PHONY: install
install: ~/.vimrc vtn
	git submodule update --init

~/.vimrc: ~/.vim/vimrc
	ln -s ~/.vim/vimrc ~/.vimrc

.PHONY: upgrade
upgrade:
	git submodule foreach git pull origin master

.PHONY: vtn
vtn:
	echo -e "\n# VimTmuxNavigator" >> ~/.tmux.conf
	echo -e "\nsource ~/.vim/misc/tmux.conf" >> ~/.tmux.conf
