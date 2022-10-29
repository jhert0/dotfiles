(use-package docker
  :ensure
  :general
  (leader-def
    :states 'normal
    "d" 'docker))

(use-package dockerfile-mode
  :ensure)

(provide 'mod-docker)
