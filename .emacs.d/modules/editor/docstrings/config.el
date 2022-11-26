;;; editor/docstrings/config.el -*- lexical-binding: t; -*-

(use-package docstr
  :ensure
  :config
  (add-hook 'csharp-mode-hook 'docstr-mode))
