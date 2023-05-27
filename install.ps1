$profile = ${env:USERPROFILE}

winget install --id LLVM.LLVM
winget install --id Git.Git
winget install --id GNU.Emacs
winget install --id Alacritty.Alacritty
winget install --id Neovim.Neovim

New-Item -ItemType SymbolicLink -Path "${profile}/AppData/Local/nvim/" -Target "{$pwd}/.config/nvim"
New-Item -ItemType SymbolicLink -Path "${profile}/.emacs.d" -Target "${pwd}/.emacs.d"
New-Item -ItemType SymbolicLink -Path "${profile}/.doom.d" -Target "${pwd}/.doom.d"
