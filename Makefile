.PHONY: install
install: ~/.vimrc
	git submodule update --init

~/.vimrc: ~/.vim/vimrc
	ln -s ~/.vim/vimrc ~/.vimrc

.PHONY: upgrade
upgrade:
	git submodule foreach git pull origin master
