;;; init-dashboard.el --- Initialize dashboard configurations. -*- lexical-binding: t; -*-

;; https://emacs-china.org/t/topic/14991/10
;; https://github.com/seagle0128/.emacs.d

;;dashboard
(use-package dashboard
  :defer t
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
    ;;(setq dashboard-startup-banner 'logo)
  (setq dashboard-startup-banner "~/.emacs.d/logo.png")
  (setq dashboard-banner-logo-title " Fortune favors the brave.")
  (setq dashboard-set-footer t)
  ;;(setq dashboard-footer-messages '("There is no sacrifice too big to accept,\n   no betrayal too small to be forgiven."))
  (setq dashboard-footer-messages '("No betrayal too small to be forgiven."))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))
  (setq dashboard-display-icons-p t)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
        
        `(((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Homepage"
         "Browse homepage"
         (lambda (&rest _) (browse-url "www.github.com/HLYTQ")))
         
         (,(all-the-icons-octicon "tools" :height 1.5)
         "Settings" "Open custom file"
         (lambda (&rest _) (find-file "~/.emacs.d/lisp")))

         (,(all-the-icons-material "restore" :height 1.5)
           "Restart" "Restart Emacs"
          (lambda (&rest _) (restart-emacs)))

         (,(all-the-icons-material "info_outline" :height 1.2 :face 'all-the-icons-lred)
          "" "Help (?/h)"
          (lambda (&rest _) (info)))

         )))

  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-heading-icons '((recents   . "history")
                                  (bookmarks . "bookmark")
                                  (agenda    . "calendar")
                                  (projects  . "briefcase")
                                  (registers . "database")))
  (setq dashboard-items '(
                          (recents  . 5)
                          (projects . 5)
                          (bookmarks . 5)
                          ))
  (setq page-break-lines-char ?—)
  (setq dashboard-page-separator "\n\f\n")
)

(use-package page-break-lines
:after dashboard
:hook (dashboard-mode . page-break-lines-mode)
)


(provide 'init-dashboard)
