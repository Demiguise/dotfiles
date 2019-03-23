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
	echo -e "\t * Symlinking $1 => $2"
	ln -sf $1 $2
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
		"lightdm"					#Display Manager
		"dbus-x11"				#Additional Tools for Display
		"terminator" 			#Terminal Emulator
		"xdg-utils"				#Additional Tools for Terminal
		"i3"							#Window Manager
		"suckless-tools" 	#Window Manager Tools
		"i3blocks"				#i3 status bar
		"python-pip"			#Python Package Manager
		"neovim"					#Text Editor
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

	onCreateSymlink ${scriptDir}/.bashrc ~/.bashrc
	onCreateSymlink ${scriptDir}/i3/config ~/.config/i3/config
	onCreateSymlink ${scriptDir}/i3/i3block.cfg ~/.config/i3/i3block.cfg
	onCreateSymlink ${scriptDir}/i3/blockscripts ~/.config/i3/blockscripts
	onCreateSymlink ${scriptDir}/terminator/config ~/.config/terminator/config

	onStepComplete
}

step_AdditionalConfiguration()
{
	onStepStart "Performing additional configuration"

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

	echo "Totes restart here"

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
