all: plugin

init:
	@if [ ! -d "bundle" ]; then \
		mkdir bundle; \
	fi; \
	if [ ! -d "bundle/Vundle.vim" ]; then \
		git clone "https://github.com/VundleVim/Vundle.vim.git" ./bundle/Vundle.vim; \
	fi; \
	vim +PluginInstall +qall; \
	if [ -d "bundle/YouCompleteMe" ]; then \
		cd "bundle/YouCompleteMe"; \
		git submodule update --init --recursive; \
		./install.py --clang-completer; \
		cd "../../"; \
	fi

plugin:
	@vim +PluginInstall +qall;

clean:
	rm -rf ./bundle

