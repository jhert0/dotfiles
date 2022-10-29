;;; editor/licensing/config.el -*- lexical-binding: t; -*-

(use-package spdx
  :ensure
  :bind (:map prog-mode-map
         ("C-c i l" . spdx-insert-spdx))
  :custom
  (spdx-copyright-holder 'auto)
  (spdx-project-detection 'auto))
