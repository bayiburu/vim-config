all:
	@if [ ! -d "./bundle" ]; then \
		mkdir ./bundle; \
	fi; \
	if [ ! -d "./bundle/Vundle.vim" ]; then \
		git clone "https://github.com/VundleVim/Vundle.vim.git" ./bundle/Vundle.vim; \
	fi; \
	vim +PluginInstall +qall

clean:
	rm -rf ./bundle

