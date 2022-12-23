(setq version-control t
      vc-follow-symlinks t)

(use-package git-gutter
  :ensure
  :diminish git-gutter+-mode
  :config
  (global-git-gutter-mode +1))

(use-package magit
  :ensure
  :general
  (leader-def
    :states 'normal
    "g" '(:ignore t :which-key "Git")
    "gg" 'magit-status
    "gd" 'magit-diff
    "gb" 'magit-blame
    "gl" 'magit-log
    "gr" 'magit-branch
    "gs" 'git-gutter+-stage-hunks
    "gS" 'magit-stage-file))

(use-package forge)

(use-package git-modes
  :ensure)

(provide 'mod-git)
