#!/bin/bash

#Script assumes that Git is already installed.

#Vars
currentStep=1
numSteps=8
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

##############################
### Utility Functions
##############################

# Expects a step name to be passed as the first argument
onStepStart()
{
	echo "------------------------------"
	echo "--- [$currentStep/$numSteps] $1"
}

onStepComplete()
{
	echo "--- [$currentStep/$numSteps] Complete"
	currentStep=$((currentStep+1))
}

onComplete()
{
	echo "------------------------------"
	echo "--- All steps complete!"
	echo "------------------------------"
}

# Expects a package name to be passed as the first argument
onInstallAptPackage()
{
	echo -e "\t * Installing $1"
	sudo apt-get install --yes -qq $1
}

onInstallPipPackage()
{
	echo -e "\t * Installing $1"
	pip install $1
}

# Expects an alternative name followed by a path to the binary
onSetAlternative()
{
	echo -e "\t * Setting $1 => $2"
	sudo update-alternatives --set $1 $2
}

# Expects a two file paths to link
onCreateSymlink()
{
	echo -e "\t * Symlinking ${scriptDir}/$1 => $2"
	linkDir=$(dirname $2)
	if [ ! -d "$linkDir" ]; then
		echo -e "\t * Making directory..."
		mkdir -p $linkDir
	fi
	if [ -d "$2" ]; then
		echo -e "\t * Ignoring existing symlink"
	else
		sudo ln -sf ${scriptDir}/$1 $2
	fi
}

##############################
### Setup Steps
##############################

step_UpdateApt()
{
	onStepStart "Updating Package List"

	sudo apt-get update

	onStepComplete
}

step_UpgradeApt()
{
	onStepStart "Upgrading Packages"

	sudo apt-get upgrade --yes

	onStepComplete
}

step_InstallAptPackages()
{
	onStepStart "Installing Apt Packages"

	packages=(
		"debsums"					#Verification of installed packaged files
		"lightdm"					#Display Manager
		"dbus-x11"				#Additional Tools for Display
		"terminator" 			#Terminal Emulator
		"xdg-utils"				#Additional Tools for Terminal
		"i3"							#Window Manager
		"suckless-tools" 	#Window Manager Tools
		"i3blocks"				#i3 status bar
		"python-pip"			#Python Package Manager
		"neovim"					#Text Editor
		"libpam-tmpdir"		#Better handling of $TMPDIR
		"debian-goodies"	#Adds checkrestart + other goodies
		"dunst"						#Notification daemon
		"libnotify-bin"		#binaries for doing notifications
		"shorewall"				#Netfilter configuration
	)

	for package in ${packages[*]}
	do
		onInstallAptPackage $package
	done

	onStepComplete
}

step_InstallPipPackages()
{
	onStepStart "Installing Pip Packages"

	packages=(
		"powerline-status"
		"pynvim"
		"neovim"
	)

	for package in ${packages[*]}
	do
		onInstallPipPackage $package
	done

	onStepComplete
}

step_SymlinkConfigs()
{
	onStepStart "Symlinking Configurations"

	onCreateSymlink .bashrc ~/.bashrc
	onCreateSymlink i3/config ~/.config/i3/config
	onCreateSymlink i3/i3block.cfg ~/.config/i3/i3block.cfg
	onCreateSymlink i3/blockscripts ~/.config/i3/blockscripts
	onCreateSymlink terminator/config ~/.config/terminator/config
	onCreateSymlink powerline/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
	onCreateSymlink powerline/PowerlineSymbols.otf ~/.local/share/fonts/PowerlineSymbols.otf
	onCreateSymlink lightdm/lightdm.conf /etc/lightdm/lightdm.conf
	onCreateSymlink lightdm/setresolution.sh ~/.config/lightdm/setresolution.sh
	onCreateSymlink nvim/init.vim ~/.config/nvim/init.vim
	onCreateSymlink nvim/plug.vim ~/.config/nvim/autoload/plug.vim

	onCreateSymlink shorewall/zones	/etc/shorewall/zones
	onCreateSymlink shorewall/policy /etc/shorewall/policy
	onCreateSymlink shorewall/interfaces /etc/shorewall/interfaces
	onCreateSymlink shorewall/rules /etc/shorewall/rules

	onStepComplete
}

step_AdditionalConfiguration()
{
	onStepStart "Performing additional configuration"

	echo -e "\t * Updating font cache..."
	fc-cache -vf ~/.local/share/fonts

	if [ -f "~/.ssh/id_ed25519" ]; then
		echo -e "\t * SSH Key already exists..."
	else
		echo -e "\t * Creating SSH key..."
		ssh-keygen -t ed25519 -N "" < /dev/null
	fi

	onStepComplete
}

step_SetAlternatives()
{
	onStepStart "Setting Alternatives"

	onSetAlternative editor /usr/bin/nvim

	onStepComplete
}

step_ScheduleRestart()
{
	onStepStart "Schedule Restart"

	echo -n "--- Restart system now? "
	read a
	if [[ $a == "Y" || $a == "y" ]]; then
		echo "--- Scheduling restart..."
		sudo shutdown -r 1
	fi

	onStepComplete
}

step_UpdateApt
step_UpgradeApt
step_InstallAptPackages
step_InstallPipPackages
step_SymlinkConfigs
step_AdditionalConfiguration
step_SetAlternatives
step_ScheduleRestart

onComplete
