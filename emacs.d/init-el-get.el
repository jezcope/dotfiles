;; Make sure we can find the tools we need
(setq exec-path
      (append exec-path '("/usr/local/bin")))

;; Bootstrap el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; Custom el-get recipes
(setq el-get-sources
      '(
        (:name ruby-tools
               :description "Collection of handy functions for Emacs ruby-mode"
               :type github
               :pkgname "rejeep/ruby-tools")
        (:name adaptive-wrap-prefix
               :description "Perform smart line-wrapping with wrap-prefix"
               :type github
               :pkgname "emacsmirror/adaptive-wrap-prefix")
        (:name haskell-mode
               :description "A Haskell editing mode"
               :type github
               :pkgname "haskell/haskell-mode"
               :build ("make")
               :load "haskell-mode-autoloads.el"
               :post-init (progn
                            (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
                            (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)))
        ))

;; Packages to install
(setq my-packages
  (append
      '(el-get
	ecb
	org-mode
        sunrise-commander
	erc
	magit
        ack
        markdown-mode
        pandoc-mode
	yasnippet
	ruby-electric
	zencoding-mode
        auctex
        zenburn-theme
        slime
        filladapt
        lacarte
        yaml-mode
        lorem-ipsum
        multiple-cursors
        color-theme-solarized
        coffee-mode
	jade-mode
        )
      (mapcar 'el-get-source-name el-get-sources)))

;; And finally, install!
(el-get 'sync my-packages)

