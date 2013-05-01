;; Install packages via el-get
(load "~/.emacs.d/init-el-get")

;; General setup
(setq tool-bar-mode nil)
(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward))

;; Choose theme
(load-theme 'tango-dark t)

;; Activate IDO-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Setup for markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; Setup for ruby
(require 'ruby-tools)

;; Setup for HTML/XML/etc
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; Setup for TeX
(setq TeX-PDF-mode t)

;; Setup for ECB
(setq ecb-options-version "2.40")
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))

;; Setup for editing mail
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

;; Setup for org-mode
(setq org-startup-indented t)
(setq org-startup-folded (quote content))

;; Load local settings
(load "init-local" t)

;; Machine-local customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)
