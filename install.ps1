New-Item -ItemType SymbolicLink -Path ".config/nvim" -Target "${env:USERPOFILE}/AppData/Local/nvim/"

git clone https://github.com/hlissner/doom-emacs "${env:USERPOFILE}"
New-Item -ItemType SymbolicLink -Path ".doom.d" -Target "${env:USERPOFILE}/.doom.d"
