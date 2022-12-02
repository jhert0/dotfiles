(when (version< emacs-version "29")
  (use-package tree-sitter
    :ensure
    :config
    (global-tree-sitter-mode)
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

  (use-package tree-sitter-langs
    :ensure))
