(when (version< emacs-version "29")
  (use-package tree-sitter
    :ensure
    :config
    (global-tree-sitter-mode)
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

  (use-package tree-sitter-langs
    :ensure))

(when (and (not (version< emacs-version "29"))
           (treesit-available-p))
  (use-package tree-sitter-module
    :straight (tree-sitter-module
               :type git :host github
               :repo "casouri/tree-sitter-module"
               :pre-build (("./batch.sh"))
               :files ("dist/*.so" "dist/*.dll" "dist/*.dylib"))
    :init
    ;; Search for tree-sitter modules in this packages build directory.
    (with-eval-after-load 'treesit
      (add-to-list 'treesit-extra-load-path
                   (straight--build-dir "tree-sitter-module")))))
