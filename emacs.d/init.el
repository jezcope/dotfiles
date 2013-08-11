;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Make dotfiles-dir point to "~/.emacs.d/"
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; Bootstrap el-get and org mode
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync '(el-get org-mode)) ;; NB - need to install org-mode here!

;; Load up main init file
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "init-main.org" dotfiles-dir))
