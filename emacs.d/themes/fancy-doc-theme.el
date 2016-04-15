(deftheme fancy-doc
  "Created 2016-04-15.")

(custom-theme-set-faces
 'fancy-doc
 '(variable-pitch ((t (:height 110 :family "Palatino Linotype"))))
 '(default ((t (:height 110 :family "Palatino Linotype"))))
 '(markdown-header-face ((t (:inherit (variable-pitch font-lock-function-name-face) :weight bold))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 2.5))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 2.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.0 :slant italic))))
 '(org-level-1 ((t (:inherit markdown-header-face :height 2.5))))
 '(org-level-2 ((t (:inherit markdown-header-face :height 2.0))))
 '(org-level-3 ((t (:inherit markdown-header-face :height 1.6))))
 '(org-level-4 ((t (:inherit markdown-header-face :height 1.2))))
 '(org-level-5 ((t (:inherit markdown-header-face :height 1.0))))
 '(org-level-6 ((t (:inherit markdown-header-face :height 1.0 :slant italic))))
 '(org-level-7 ((t (:inherit markdown-header-face :height 1.0 :slant italic))))
 '(org-level-8 ((t (:inherit markdown-header-face :height 1.0 :slant italic))))
)

(provide-theme 'fancy-doc)
