@ECHO OFF

set USERDIR=%HOMEDRIVE%%HOMEPATH%
set WORKINGDIR=%~dp0

echo =====
echo Setting up dotfiles for [%USERDIR%] from [%WORKINGDIR%]
echo =====

echo Linking [%WORKINGDIR%\git\.gitconfig] to [%USERDIR%\.gitconfig]
mklink %USERDIR%\.gitconfig %WORKINGDIR%\git\.gitconfig

echo Linking [%WORKINGDIR%\vim\.vimrc] to [%USERDIR%\.vimrc]
mklink %USERDIR%\.vimrc %WORKINGDIR%\vim\.vimrc

echo Linking [%WORKINGDIR%\vim\.vim] to [%USERDIR%\.vim]
mklink /D %USERDIR%\.vim %WORKINGDIR%\vim\.vim