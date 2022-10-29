;;; langs/rust/config.el -*- lexical-binding: t; -*-

(use-package rustic
  :ensure
  :config
  (setq rustic-format-on-save t)
  (setq rustic-lsp-client 'eglot))

(use-package cargo
  :ensure
  :general
  (local-leader-def
    :states 'normal
    :keymaps 'rust-mode-map
    "cc" 'cargo-process-build
    "cr" 'cargo-process-run
    "ct" 'cargo-process-test))
