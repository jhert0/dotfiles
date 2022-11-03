$home = ${env:USERPROFILE}

winget install --id LLVM.LLVM
winget install --id Git.Git
winget install --id GNU.Emacs

New-Item -ItemType SymbolicLink -Path "${home}/AppData/Local/nvim/" -Target "{$pwd}/.config/nvim"
New-Item -ItemType SymbolicLink -Path "${home}/.emacs.d" -Target "${pwd}/.emacs.d"
New-Item -ItemType SymbolicLink -Path "${home}/.doom.d" -Target "${pwd}/.doom.d"
