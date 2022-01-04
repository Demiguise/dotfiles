#!/bin/bash

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

USER_HOME=$HOME

if [[ "$EUID" -eq 0 ]]; then
	USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
fi

echo Working Dir: ${WORKING_DIR}
echo User Dir: ${USER_HOME}

# Expects a two file paths to link
onCreateSymlink()
{
	echo -e "\t * Symlinking ${WORKING_DIR}/$1 => $2"
	linkDir=$(dirname $2)
	if [ ! -d "$linkDir" ]; then
		echo -e "\t * Making directory..."
		mkdir -p $linkDir
	fi
	if [ -d "$2" ]; then
		echo -e "\t * Ignoring existing symlink"
	else
		sudo ln -sf ${WORKING_DIR}/$1 $2
	fi
	sudo chown -h $USER:$USER $2
}

onCreateFile()
{
	echo -e "\t * Touching $1"
	touch $1
}

onCreateSymlink git/.gitconfig ${USER_HOME}/.gitconfig
onCreateSymlink vim/.vimrc ${USER_HOME}/.vimrc
onCreateSymlink vim/.vim ${USER_HOME}/.vim
onCreateSymlink bash/.bashrc ${USER_HOME}/.bashrc

onCreateFile ${WORKING_DIR}/vim/.vim/local.vim
onCreateFile ${USER_HOME}/.device.gitconfig
