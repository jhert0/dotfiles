;;; langs/javascript/config.el -*- lexical-binding: t; -*-

(use-package js2-mode
  :ensure
  :commands js2-mode
  :mode ("\\.js$" . js2-mode))
