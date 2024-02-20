$profile = ${env:USERPROFILE}
$pwd = Get-Location

winget install Git.Git
winget install GNU.Emacs
winget install Neovim.Neovim

New-Item -ItemType SymbolicLink -Path "${profile}/AppData/Local/nvim/" -Target "{$pwd}/.config/nvim"
New-Item -ItemType SymbolicLink -Path "${profile}/.emacs.d" -Target "${pwd}/.emacs.d"
