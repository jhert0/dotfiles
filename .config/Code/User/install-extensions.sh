#!/bin/sh

vscode="code"

if command -v code-oss &> /dev/null
then
     vscode="code-oss"
fi

$vscode --install-extension aaron-bond.better-comments
$vscode --install-extension EditorConfig.EditorConfig
$vscode --install-extension golang.go
$vscode --install-extension k--kato.docomment
$vscode --install-extension kahole.magit
$vscode --install-extension ms-azuretools.vscode-docker
$vscode --install-extension ms-dotnettools.csharp
$vscode --install-extension ms-python.python
$vscode --install-extension ms-toolsai.jupyter
$vscode --install-extension viktorqvarfordt.vscode-pitch-black-theme
$vscode --install-extension vscodevim.vim
