;;; config.el --- Initialize config configurations. -*- lexical-binding: t; -*-
 
(setq gc-cons-threshold most-positive-fixnum)

(global-hl-line-mode 1)

;; set language environment
(set-language-environment 'utf-8)

;; (defun init-window-size ()
;; set language environment
;;  (set-frame-size (selected-frame) 80 27))
;; (add-hook 'window-setup-hook 'init-window-size)

;; no backup file *.*~
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

;; close some ugly widgets
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; set auto save
(setq-default auto-save-timeout 15)
(setq-default auto-save-interval 100)

(setq help-window-select 't)
;; (ido-mode t)
;; (global-auto-revert-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq column-number-mode t)

;; Electric-Pair
(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-layout-mode)

(add-hook 'gdb-mode-hook 'gdb-many-windows)

;; Highlight pair
(show-paren-mode 1)

(save-place-mode 1)

;; org-mode
(setq org-hide-leading-stars t
      org-startup-indented t)
(setq org-agenda-files (list "~/Documents/test.org" "~/Documents/BecomeATrueEmacser.org"))

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)

(provide 'config)
