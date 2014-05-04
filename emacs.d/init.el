;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Make dotfiles-dir point to "~/.emacs.d/"
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; Add ~/.emacs.d/elpa if it doesn't exist
(make-directory (expand-file-name "elpa" dotfiles-dir) t)

;; Bootstrap el-get and org mode
(load (expand-file-name "el-get-local.el" dotfiles-dir) t)
(add-to-list 'load-path
	     (expand-file-name "el-get" (if (boundp 'el-get-dir)
					    el-get-dir
					    "~/.emacs.d/el-get/")))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync '(el-get org-mode)) ;; NB - need to install org-mode here!

;; Load up main init file
(require 'org)

(defun jc/require-org-file (name)
  (org-babel-load-file (expand-file-name name dotfiles-dir)))

(jc/require-org-file "init-main.org")
