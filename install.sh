#!/bin/sh

set -e

# Default settings

REPO=https://github.com/joywek/VimSettings.git
CONFIG_DIR=~/.vim
VUNDLE_DIR=${CONFIG_DIR}/bundle/Vundle.vim

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup_config() {

	echo "${BLUE}Cloning vim-config...${RESET}"
	
	command_exists git || {
		error "git is not installed."
		exit 1
	}

	if [ ! -d ~/.vim ]; then
		git clone https://github.com/joywek/VimSettings.git ${CONFIG_DIR} || {
			error "git clone of vim-config failed."
			exit 1
		}
	else
		cd ${CONFIG_DIR}
		git pull
	fi

	echo "${BLUE}Creating linked file of vimrc...${RESET}"
	rm -f ~/.vimrc
	ln -s ${CONFIG_DIR}/vimrc ~/.vimrc
}

setup_plugins() {

		echo "${BLUE}Cloning Vundle...${RESET}"

		cd ${CONFIG_DIR}
		if [ ! -d "bundle" ]; then
			mkdir bundle
		fi

		if [ ! -d ${VUNDLE_DIR} ]; then
			git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_DIR}
		else
			cd bundle
			git pull
			cd ${CONFIG_DIR}
		fi

		echo "${BLUE}Installing plugins...${RESET}"

		vim +PluginInstall +qall

		if [ -d "bundle/YouCompleteMe" ]; then
			cd "bundle/YouCompleteMe"
			git submodule update --init --recursive
			./install.py --clang-completer
		fi

}

main() {

	setup_color
	setup_config
	setup_plugins

}

main "$@"
