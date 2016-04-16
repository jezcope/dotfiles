;;; init.el --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Make user-emacs-directory point to "~/.emacs.d/"
(setq user-emacs-directory (file-name-directory (or (buffer-file-name) load-file-name)))

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'use-package)

;; Add ~/.emacs.d/elpa if it doesn't exist
;; (make-directory (expand-file-name "elpa" user-emacs-directory) t)

;; Bootstrap el-get and org mode
;; (load (expand-file-name "el-get-local.el" user-emacs-directory) t)
;; (add-to-list 'load-path
;; 	     (expand-file-name "el-get" (if (boundp 'el-get-dir)
;; 					    el-get-dir
;; 					    "~/.emacs.d/el-get/")))
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))
;; (el-get 'sync '(el-get org-mode)) ;; NB - need to install org-mode here!

;; Load up main init file
(use-package org)

(defun jc/require-org-file (name)
  (org-babel-load-file (expand-file-name name user-emacs-directory)))

(jc/require-org-file "init-main.org")
