;;; projectile.el --- description -*- lexical-binding: t; -*-

(use-package projectile
  :ensure
  :general
  (leader-def
    :states 'normal
    "p" '(:ignore t :which-key "projects")
    "pp" 'projectile-find-file
    "pf" 'projectile-find-file
    "pb" 'projectile-switch-to-buffer
    "pd" 'projectile-dired
    "pk" 'projectile-kill-buffers
    "pt" 'projectile-run-term
    "ps" 'projectile-switch-project
    "pi" 'projectile-invalidate-cache)
  :config
  (setq projectile-cache-file (concat core/cache-dir "projectile.cache"))
  (projectile-mode))

(use-package ibuffer-projectile
  :ensure
  :after projectile
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))
