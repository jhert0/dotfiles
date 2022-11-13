;;; langs/latex/config.el -*- lexical-binding: t; -*-

(use-package tex
  :straight auctex
  :config
  (setq LaTeX-item-indent 0)

  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode))

(add-hook 'tex-mode-hook 'visual-line-mode)
(add-hook 'latex-mode-hook 'visual-line-mode)

(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'flyspell-mode)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)
