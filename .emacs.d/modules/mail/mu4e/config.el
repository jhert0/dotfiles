;;; mail/mu4e/config.el -*- lexical-binding: t; -*-

;; TODO: figure out a better way to determine if mu4e is available
(defvar mu4e-path "/usr/share/emacs/site-lisp/mu4e/")

(if (file-exists-p mu4e-path)
    (progn
      (add-to-list 'load-path mu4e-path)

      (require 'mu4e)

      (setq mu4e-maildir (expand-file-name "~/mail"))
      (setq mu4e-get-mail-command "mbsync -a"))
  (message "mu4e not found, skipping..."))
