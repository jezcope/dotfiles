;; Set up package.el
;(require 'package)
;(add-to-list 'package-archives
;  '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(package-initialize)

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
               :build `(("make" "CEDET=../cedet"
                         ,(concat "EMACS=" (shell-quote-argument
                                            el-get-emacs)))))
        (:name pandoc-mode
               :description "Emacs mode for interacting with Pandoc."
               :type github
               :pkgname "joostkremers/pandoc-mode")
        (:name ruby-electric
               :description "Improved ruby-electric mode"
               :type github
               :pkgname "qoobaa/ruby-electric")
        (:name ruby-tools
               :description "Collection of handy functions for Emacs ruby-mode"
               :type github
               :pkgname "rejeep/ruby-tools")
        (:name zencoding-mode
               :description "A neat way to write markup quickly in emacs"
               :type github
               :pkgname "smihica/zencoding")
	(:name adaptive-wrap-prefix
	       :description "Perform smart line-wrapping with wrap-prefix"
	       :type github
	       :pkgname "emacsmirror/adaptive-wrap-prefix")
        ))

;; Packages to install
(setq my-packages
  (append
      '(el-get
	org-mode
        ack
        markdown-mode
        pandoc-mode
        auctex
        magit
        zenburn-theme
	slime
	filladapt
	haskell-mode
	lacarte
        )
      (mapcar 'el-get-source-name el-get-sources)))

;; And finally, install!
(el-get 'sync my-packages)

