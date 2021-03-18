@ECHO OFF

set USERDIR=%HOMEDRIVE%%HOMEPATH%
set WORKINGDIR=%CD%

echo Setting up dotfiles for [%USERDIR%] from [%WORKINGDIR%]

echo Linking [%WORKINGDIR%\git\.gitconfig] to [%USERDIR%\.gitconfig]
mklink %USERDIR%\.gitconfig %WORKINGDIR%\git\.gitconfig