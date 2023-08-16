;;; init-ui.el --- Initialize ui configurations. -*- lexical-binding: t; -*-

;; set theme and font
(use-package doom-themes
  :init
  (load-theme 'doom-monokai-octagon t))
;; (set-face-attribute 'region nil :background "#6B8E23"))

(set-face-attribute 'default nil :font "Monaco" :height 160)

(set-face-attribute 'show-paren-match nil :background "sea green")
(set-frame-parameter nil 'alpha 100)

(use-package all-the-icons
  :ensure t
  :if(display-graphic-p))

(use-package all-the-icons-dired
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode)
  :custom-face
  (all-the-icons-dired-dir-face ((t (:foreground "orange"))))
  :config
  (setq all-the-icons-dired-monochrome nil))


(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom-face
  (rainbow-delimiters-base-face ((t (:inherit nil))))
  (rainbow-delimiters-depth-1-face ((t (:foreground "light pink"))))
  (rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
  (rainbow-delimiters-depth-3-face ((t (:foreground "forest green"))))
  (rainbow-delimiters-depth-4-face ((t (:foreground "dodger blue"))))
  (rainbow-delimiters-depth-5-face ((t (:foreground "deep pink"))))
  (rainbow-delimiters-depth-6-face ((t (:foreground "dark turquoise"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "tomato1"))))
  (rainbow-delimiters-depth-8-face ((t (:foreground "PaleVioletRed1"))))
  (rainbow-delimiters-depth-9-face ((t (:foreground "SeaGreen1")))))

(add-hook 'Info-mode-hook 'self-add-window-margins)
(add-hook 'org-mode-hook 'self-add-window-margins)
(add-hook 'text-mode-hook 'self-add-window-margins)


;; Use: list-colors-display watch colors
;; (set-cursor-color "cyan")

;; (if (window-system)
;;     (setq initial-frame-alist '((top . 20) (left . 200) (width . 80) (height . 27))))

;; (mouse-avoidance-mode t)

;; (let ((my/minor-mode-alist '((flymake-mode flymake-mode-line-counters ) eglot)))
;;   (setq mode-line-modes
;;         (mapcar (lambda (elem)
;;                   (pcase elem
;;                     (`(:propertize (,_ minor-mode-alist . ,_) . ,_)
;;                      `(:propertize ("" ,my/minor-mode-alist)
;; 			                       mouse-face mode-line-highlight
;; 			                       local-map ,mode-line-minor-mode-keymap)
;;                      )
;;                     (_ elem)))
;;                 mode-line-modes)
;;         ))


(provide 'init-ui)

