;; Install packages via el-get
(load "~/.emacs.d/init-el-get")

;; General setup
(require 'uniquify)
(setq tool-bar-mode nil
      menu-bar-mode nil
      scroll-bar-mode nil
      uniquify-buffer-name-style (quote post-forward)
      indent-tabs-mode nil
      standard-indent 2
      tab-stop-list (loop for n from 2 below 80 by 2 collect n)
      tab-width 2
      ispell-dictionary "british"
      )
(global-auto-revert-mode)

;; Choose theme
(load-theme 'tango-dark t)

;; Activate filladapt-mode
(require 'filladapt)
(setq-default filladapt-mode t)

;; Activate IDO-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Activate Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Activate multiple-cursors
(require 'multiple-cursors)

;; Setup for markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
;(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; Setup for ruby
(require 'ruby-tools)
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))

;; Setup for HTML/XML/etc
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; Setup for TeX
(setq TeX-PDF-mode t)

;; Setup for ECB
(setq ecb-options-version "2.40"
      ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1)
      ecb-compilation-major-modes (quote (compilation-mode TeX-output-mode)))

;; Setup for editing mail
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))
(add-hook 'mail-mode-hook 'visual-line-mode)

;; Setup for org-mode
(setq org-startup-indented t
      org-startup-folded (quote content)
      org-babel-load-languages (quote ((emacs-lisp . t) (ruby . t) (sh . t))))

;; Setup for dired/sunrise
(setq dired-omit-files "^\\.")

;; Setup for whitespace-mode
(setq whitespace-style
      (quote (face tabs spaces trailing lines space-before-tab
                   newline empty space-after-tab space-mark tab-mark
                   newline-mark)))

;; Setup for shell scripts
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("PKGBUILD\\'" . sh-mode))

;; unfill-paragraph http://www.emacswiki.org/emacs/UnfillParagraph
;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; Load local settings
(load "init-local" t)

;; Machine-local customizations
(setq custom-file
      (concat "~/.emacs.d/custom." (system-name) ".el"))
(load custom-file t)

;; And finally start the server
(server-start)
