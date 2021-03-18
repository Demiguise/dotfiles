@ECHO OFF

set USERDIR=%HOMEDRIVE%%HOMEPATH%
set WORKINGDIR=%~dp0

echo =====
echo Setting up dotfiles for [%USERDIR%] from [%WORKINGDIR%]
echo =====

echo Linking [%WORKINGDIR%\git\.gitconfig] to [%USERDIR%\.gitconfig]
mklink %USERDIR%\.gitconfig %WORKINGDIR%\git\.gitconfig