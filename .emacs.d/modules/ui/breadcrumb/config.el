;;; ui/breadcrumb/config.el -*- lexical-binding: t; -*-

(use-package breadcrumb
  :ensure
  :config
  (add-hook 'prog-mode-hook 'breadcrumb-local-mode))
