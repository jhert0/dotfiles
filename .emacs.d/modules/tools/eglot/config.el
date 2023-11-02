(when (version< emacs-version "29")
  (straight-use-package 'eglot))

(require 'eglot)

(setq eglot-autoshutdown t)

(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c++-ts-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'csharp-mode-hook 'eglot-ensure)
(add-hook 'scala-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs '(csharp-mode . ("csharp-ls")))
(add-to-list 'eglot-server-programs '(scala-mode . ("metals")))
