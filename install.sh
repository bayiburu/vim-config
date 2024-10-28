#!/bin/sh

# Enable instant exit mode.
set -e

REPO=https://github.com/bayiburu/vim-config.git
VIM_DIR=~/.vim

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
	
	command_exists curl || {
		error "curl is not installed."
		exit 1
	}

	command_exists git || {
		error "git is not installed."
		exit 1
	}

	if [ ! -d ${VIM_DIR} ]; then
		git clone ${REPO} ${VIM_DIR} || {
			error "git clone of vim-config failed."
			exit 1
		}
	else
		cd ${VIM_DIR}
		git pull
	fi

	echo "${BLUE}Creating linked file of vimrc ...${RESET}"
	rm -f ~/.vimrc
	ln -s ${VIM_DIR}/vimrc ~/.vimrc
}

install_plugins() {
	echo "${BLUE}Downloading vim-plug ...${RESET}"
	curl -fLo ${VIM_DIR}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo "${BLUE}Installing plugins...${RESET}"
	vim +PlugInstall +qall
}

main() {
	setup_color
	setup_config
	install_plugins
}

main "$@"
