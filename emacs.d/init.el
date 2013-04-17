;; Set up package.el
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Bootstrap el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Custom el-get recipes
(setq el-get-sources
      '(
        (:name ecb
	       :description "Emacs Code Browser"
	       :type github
	       :pkgname "alexott/ecb"
	       :depends cedet
	       :build `(("make" "CEDET=../cedet" ,(concat "EMACS=" (shell-quote-argument el-get-emacs)))))
	(:name pandoc-mode
	       :type github
	       :description "Emacs mode for interacting with Pandoc."
	       :pkgname "joostkremers/pandoc-mode")
	(:name ruby-electric
	       :type github
	       :description "Improved ruby-electric mode"
	       :pkgname "qoobaa/ruby-electric")
	(:name ruby-tools
	       :type github
	       :description "Collection of handy functions for Emacs ruby-mode"
	       :pkgname "rejeep/ruby-tools")
	(:name zencoding-mode
	       :type github
	       :description "A neat way to write markup quickly in emacs"
	       :pkgname "smihica/zencoding")
	))

;; Packages to install
(setq my-packages
  (append
      '(el-get
	;ecb
	ack
	markdown-mode
	pandoc-mode
	auctex
	magit
	zenburn-theme
	)
      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

;; General setup
(setq tool-bar-mode nil)
(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward))

;; Choose theme
(load-theme 'tango-dark t)

;; Setup for markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(add-hook 'markdown-mode-hook 'visual-line-mode)

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
