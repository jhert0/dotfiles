(use-package docker
  :ensure
  :general
  (general-define-key
    :states '(normal emacs)
    "C-c d" 'docker))

(use-package dockerfile-mode
  :ensure)

(provide 'mod-docker)
