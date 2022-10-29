;;; langs/yaml/config.el -*- lexical-binding: t; -*-

(use-package yaml-mode
  :ensure
  :commands yaml-mode
  :mode ("\\.yml$" . yaml-mode))
