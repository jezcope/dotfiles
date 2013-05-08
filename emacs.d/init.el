;; Install packages via el-get
(load "~/.emacs.d/init-el-get")

;; General setup
(require 'uniquify)
(setq tool-bar-mode nil
      menu-bar-mode nil
      uniquify-buffer-name-style (quote post-forward)
      indent-tabs-mode nil
      standard-indent 2
      ;; TODO: There must be a more concise way to express this:
      tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32))
      tab-width 2)
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

;; Setup for markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
;(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)
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
(add-hook 'mail-mode-hook 'visual-line-mode)

;; Setup for org-mode
(setq org-startup-indented t)
(setq org-startup-folded (quote content))

;; Setup for whitespace-mode
(setq whitespace-style
      (quote (face tabs spaces trailing lines space-before-tab
                   newline empty space-after-tab space-mark tab-mark
                   newline-mark)))

;; Setup for shell scripts
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

;; Load local settings
(load "init-local" t)

;; Machine-local customizations
(setq custom-file
      (concat "~/.emacs.d/custom." (system-name) ".el"))
(load custom-file t)

;; And finally start the server
(server-start)
