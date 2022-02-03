;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-hook 'window-setup-hook #'toggle-frame-maximized)

(use-package! darkokai-theme
  :config
  (setq darkokai-mode-line-padding 1))

(use-package! nyan-mode
  :config
  (nyan-mode 1))

(use-package! emojify
  :config
  (add-hook 'text-mode-hook #'emojify-mode)
  (add-hook 'org-mode-hook #'emojify-mode)
  (add-hook 'markdown-mode-hook #'emojify-mode))

(setq doom-font (font-spec :family "Iosevka" :size 18))
(setq doom-theme 'darkokai)
(setq org-directory "~/docs/org/")
(setq display-line-numbers-type 'relative)
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
(setq require-final-newline t)
(setq confirm-kill-emacs nil)
(setq initial-major-mode 'text-mode)

(defun enable-trailing-whitespace()
  (setq-local show-trailing-whitespace t))

(add-hook 'prog-mode-hook #'enable-trailing-whitespace)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

(after! evil
  (setq evil-normal-state-cursor '("white" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
  (setq evil-visual-state-cursor '("purple" box))
  (setq evil-replace-state-cursor '("red" hbar))
  (setq evil-motion-state-cursor '("orange" box))
  (setq evil-emacs-state-cursor '("purple" box)))

(after! company
  (setq company-idle-delay 0.1))

;; web-mode

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 4)

(setq web-mode-engines-alist
      '(("go" . "\\.tpl\\'")))

;; go

(after! go
  (setq gofmt-command "goimports"))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-include-signature t
        lsp-ui-doc-max-height 20
        lsp-ui-doc-max-width 100
        lsp-ui-doc-position 'at-point))

;; graphql

(use-package! graphql-mode
  :mode ("\\.gql\\'" "\\.graphql\\'")
  :config (setq-hook! 'graphql-mode-hook tab-width graphql-indent-level))

;; writing

(setq-hook! text-mode fill-column 72)
(setq-hook! markdown-mode fill-column 72)
(setq-hook! org-mode fill-column 72)

(add-hook! 'text-mode-hook 'auto-fill-mode)
(add-hook! 'markdown-mode-hook 'auto-fill-mode)
(add-hook! 'org-mode-hook 'auto-fill-mode)

(add-hook! 'text-mode-hook 'visual-line-mode)
(add-hook! 'markdown-mode-hook 'visual-line-mode)
(add-hook! 'org-mode-hook 'visual-line-mode)

;; formatting

(add-to-list '+format-on-save-enabled-modes 'c-mode t)
(add-to-list '+format-on-save-enabled-modes 'c++-mode t)
(add-to-list '+format-on-save-enabled-modes 'python-mode t)
(add-to-list '+format-on-save-enabled-modes 'emacs-lisp-mode t)

(use-package! clang-format+
  :config
  (add-hook! c-mode-hook clang-format+-mode)
  (add-hook! c++-mode-hook clang-format+-mode))

;; bindings

(map!
 :leader
 :desc "M-x"
 :map general-override-mode-map
 :n "SPC" #'execute-extended-command)

;; email

(use-package! mu4e
  :load-path "/usr/share/emacs/site-lisp/mu4e"
  :config
  (setq mu4e-sent-messages-behavior 'delete)
  (add-hook! 'mu4e-view-mode 'visual-line-mode)

  (setq mu4e-context-policy 'pick-first)
  (setq mu4e-compose-context-policy 'always-ask))

(defvar private-config (concat doom-private-dir "private.el"))

(if (file-exists-p private-config)
    (load private-config))
