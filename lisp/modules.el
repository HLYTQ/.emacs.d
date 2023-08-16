;;; modules.el --- Initialize modules configurations. -*- lexical-binding: t; -*-

;; This file contain package and their keymap

(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

(use-package helm-themes
  :ensure t
  :bind (("C-h t" . helm-themes)))

(use-package restart-emacs
  :ensure t
  :bind (("C-c R" . restart-emacs)))

(use-package hungry-delete
  :ensure t
  :hook ((prog-mode . global-hungry-delete-mode)))

;;(use-package multiple-cursors)
;;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package org-bullets
  :ensure t
  :commands org-bullets-mode
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '( "" "" "" "✸" ))
)

(use-package projectile
  :ensure t)

;; Need Emacs 28
;;(use-package vundo
;;  :config
;;  (vundo-global-mode 1))

(use-package sdcv
  :ensure t
  :config
  (setq sdcv-dictionary-simple-list
        '("懒虫简明英汉词典"
          "懒虫简明汉英词典"
          "计算机词汇")))

;; 中英文表格对齐问题
;; just use in org-mode
(use-package valign
  :ensure t
  :if (window-system)
  :defer t
  :hook (org-mode . valign-mode))

(use-package pdf-tools
  ;;  
  :config
  (pdf-loader-install))


(use-package neotree
  :ensure t
  :bind (("C-c t t" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action)
  ;;(add-hook 'neotree-mode-hook
  ;;          (lambda ()
  ;;            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
  ;;            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
  ;;            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
  ;;            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
 )

(use-package hideshow
  :hook (prog-mode . hs-minor-mode)
  :bind (("C-c TAB" . hs-toggle-hiding)
         ("C-c p +" . hs-show-all)))


(provide 'modules)
