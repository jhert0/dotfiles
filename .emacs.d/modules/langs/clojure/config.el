;;; langs/clojure/config.el -*- lexical-binding: t; -*-

(use-package clojure-mode)

(use-package cider
  :config
  (add-hook 'clojure-mode-hook 'cider-mode))
