(when (version< emacs-version "29")
  (straight-use-package 'eglot))

(require 'eglot)

(setq eglot-autoshutdown t)

(add-hook 'python-mode-hook 'eglot)
(add-hook 'c-mode-hook 'eglot)
(add-hook 'c++-mode-hook 'eglot)
(add-hook 'go-mode-hook 'eglot)
(add-hook 'rust-mode-hook 'eglot)
(add-hook 'csharp-mode-hook 'eglot)
(add-hook 'scala-mode-hook 'eglot)

(add-to-list 'eglot-server-programs '(csharp-mode . ("csharp-ls")))
(add-to-list 'eglot-server-programs '(scala-mode . ("metals")))
