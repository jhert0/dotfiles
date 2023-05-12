;;; editor/docstrings/config.el -*- lexical-binding: t; -*-

(use-package docstr
  :ensure
  :config
  (setq docstr-c++-style 'javadoc)

  (add-hook 'csharp-mode-hook 'docstr-mode)
  (add-hook 'c++-mode-hook 'docstr-mode))
