$home = ${env:USERPROFILE}

winget install --id LLVM.LLVM
winget install --id Git.Git
winget install --id GNU.Emacs

New-Item -ItemType SymbolicLink -Path "${home}/AppData/Local/nvim/" -Target "{$pwd}/.config/nvim"

if -Not Test-Path -Path "${home}/.emacs.d" {
    git clone https://github.com/hlissner/doom-emacs "${home}/.emacs.d"
}

New-Item -ItemType SymbolicLink -Path "${home}/.doom.d" -Target "${pwd}/.doom.d"
