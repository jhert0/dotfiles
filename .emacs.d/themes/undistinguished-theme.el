;;; undistinguished-theme.el --- A dark and elegant theme for emacs.

;; Copyright © 2014 Kim Silkebækken, 2022 Jeremy

;; Author: Kim Silkebækken &lt;kim.silkebaekken@gmail.com&gt;
;;         Jeremy

;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; A modified version of the dinstinguished theme for emacs.

;;; Code:
(deftheme undistinguished "undistinguished color theme")

(let ((undst-fg "#ffffff")
      (undst-bg "#000000")
      (undst-bg+0 "#151311")
      (undst-bg+1 "#252321")
      (undst-bg+2 "#474544")
      (undst-gray "#969385")
      (undst-gray+1 "#b4b1a2")
      (undst-gray+2 "#d0cbc0")
      (undst-steel "#8a9496")
      (undst-steel+1 "#acb0b3")
      (undst-steel+2 "#c0c7ca")
      (undst-blue "#67809c")
      (undst-blue+1 "#b2c3cc")
      (undst-blue+2 "#d9e2ff")
      (undst-green-2 "#646d14")
      (undst-green-1 "#869038")
      (undst-green "#a4ac64")
      (undst-green+1 "#aca639")
      (undst-green+2 "#8fac39")
      (undst-green+3 "#73ac39")
      (undst-red-3 "#3f1c0f")
      (undst-red-2 "#7c2a09")
      (undst-red-1 "#a7502d")
      (undst-red "#d47c59")
      (undst-red+1 "#edb08f")
      (undst-red+2 "#edbca2")
      (undst-pink "#e599e8")
      (undst-yellow "#d7af5f")
      (undst-yellow+1 "#ffd75f")
      (undst-yellow+2 "#f9ee98")
      (undst-intense-red "#ff2a00")
      )
  (custom-theme-set-faces
   'undistinguished
   `(default ((t (:foreground ,undst-fg :background ,undst-bg))))
   `(cursor ((t (:foreground ,undst-bg :background ,undst-fg))))
   `(hl-line ((t (:background ,undst-bg+0))))
   `(minibuffer-prompt ((t (:foreground ,undst-steel+2 :weight bold))))
   `(region ((t (:background ,undst-bg+2))))
   `(fringe ((t (:foreground ,undst-gray+2 :background ,undst-bg))))
   `(line-number-current-line ((t :foreground ,undst-yellow, :weight bold)))
   `(success ((t (:foreground ,undst-green+3))))
   `(error ((t (:foreground ,undst-intense-red))))

   ;; font lock
   `(font-lock-builtin-face ((t (:foreground ,undst-yellow+1 :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,undst-gray :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,undst-bg+2 :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,undst-gray))))
   `(font-lock-constant-face ((t (:foreground ,undst-yellow+1 :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,undst-red :weight bold))))
   `(font-lock-keyword-face ((t (:foreground ,undst-blue :slant italic :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,undst-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,undst-steel+1 :weight bold :slant italic))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,undst-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,undst-red :weight bold))))
   `(font-lock-string-face ((t (:foreground ,undst-green))))
   `(font-lock-type-face ((t (:foreground ,undst-pink :weight bold))))
   `(font-lock-variable-name-face ((t (:foreground ,undst-blue+1 :weight normal))))
   `(font-lock-warning-face ((t (:foreground ,undst-intense-red :weight bold))))

   ;; mode line
   `(mode-line ((t (:foreground ,undst-fg :background ,undst-bg))))
   `(mode-line-inactive ((t (:foreground ,undst-fg :background ,undst-bg+0))))

   ;; doom modeline
   `(doom-modeline-evil-emacs-state ((t (:foreground ,undst-pink :weight bold))))
   `(doom-modeline-evil-insert-state ((t (:foreground ,undst-green+3 :weight bold))))
   `(doom-modeline-evil-normal-state ((t (:foreground ,undst-blue :weight bold))))
   `(doom-modeline-evil-operator-state ((t (:foreground ,undst-intense-red :weight bold))))
   `(doom-modeline-evil-visual-state ((t (:foreground ,undst-red+2 :weight bold))))
   `(doom-modeline-evil-replace-state ((t (:foreground ,undst-intense-red :weight bold))))

   ;; whitespace-mode
   `(whitespace-tab ((t (:foreground ,undst-bg+2 :background nil :weight normal))))
   `(whitespace-space ((t (:foreground ,undst-bg+2 :background nil :weight normal))))
   `(whitespace-newline ((t (:foreground ,undst-red-3 :background nil :weight normal))))

   ;; show parens
   `(show-paren-mismatch ((t (:foreground ,undst-fg :background ,undst-red-1 :weight bold))))
   `(show-paren-match ((t (:foreground ,undst-fg :background ,undst-green-2 :weight bold))))

   ;; search highlight
   `(isearch ((t (:foreground ,undst-fg :background ,undst-green-2 :weight bold :slant normal))))
   `(isearch-fail ((t (:foreground ,undst-fg :background ,undst-red-1 :weight bold :slant normal))))
   `(lazy-highlight ((t (:foreground ,undst-bg :background ,undst-yellow+1 :weight bold :slant normal))))

   ;; tooltip
   `(tooltip ((t (:background ,undst-bg+2))))

   ;; evil-goggles
   `(evil-goggles-delete-face ((t (:background ,undst-red-3))))
   `(evil-goggles-yank-face ((t (:background ,undst-yellow))))
   `(evil-goggles-paste-face ((t (:background ,undst-green-2))))

   ;; rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,undst-yellow+2))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,undst-green))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,undst-red+1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,undst-blue+1))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,undst-yellow+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,undst-green))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,undst-red+1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,undst-blue+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,undst-yellow+2))))

   ;; git-gutter
   `(git-gutter:added ((t (:foreground ,undst-green+3 :weight bold :inherit fringe))))
   `(git-gutter:deleted ((t (:foreground ,undst-red :weight bold :inherit fringe))))
   `(git-gutter:modified ((t (:foreground ,undst-yellow+1 :weight bold :inherit fringe))))
   `(git-gutter:unchanged ((t (:foreground ,undst-fg :weight bold :inherit fringe))))

   ;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,undst-green+3  :weight bold :inherit fringe))))
   `(git-gutter-fr:deleted ((t (:foreground ,undst-red :weight bold :inherit fringe))))
   `(git-gutter-fr:modified ((t (:foreground ,undst-yellow+1 :weight bold :inherit fringe))))

   ;; git-commit
   `(git-commit-summary ((t (:foreground ,undst-fg))))

   ;; ivy
   `(ivy-current-match ((t (:foreground ,undst-bg :background ,undst-pink))))

   ;; web-mode
   `(web-mode-html-tag-face ((t (:foreground ,undst-blue+1, :weight bold))))
   `(web-mode-html-attr-name-face ((t (:foreground ,undst-red))))
   `(web-mode-html-tag-bracket-face ((t (:inherit default))))
   `(web-mode-current-element-highlight-face ((t (:inherit show-paren-match))))
   ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'undistinguished)
;;; undistinguished-theme.el ends here
