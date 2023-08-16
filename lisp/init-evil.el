;;; init-evil.el --- Initialize evil configurations. -*- lexical-binding: t; -*-

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode t)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
)

(use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))

(use-package evil-leader
  :after evil
  :init (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "s" 'swiper
    "S" 'swiper-isearch-backward
    "u" 'universal-argument
    "ff" 'counsel-find-file
    "fr" 'counsel-recentf
    "fs" 'counsel-imenu
    "fp" 'open-config-file
    "bd" 'kill-buffer 
    "bb" 'switch-to-buffer
    "bi" 'ibuffer
    "ee" 'eval-last-sexp
    "[" 'c-switch-to-prev-buffer
    "]" 'c-switch-to-next-buffer
    "<SPC>" 'counsel-M-x
    "'" 'vterm-toggle-cd
    "wj" 'windmove-down
    "wh" 'windmove-left
    "wk" 'windmove-up
    "wl" 'windmove-right
    "w+" 'w-resize-increase
    "w-" 'w-resize-decrease
    "w>" 'w-resize-right
    "w<" 'w-resize-left
    "tt" 'neotree-toggle
    "dd" 'sdcv-search-pointer+
    "di" 'sdcv-search-input+
    "qR" 'restart-emacs
    "qE" 'save-and-exit
    "ht" 'helm-themes
    "hf" 'counsel-describe-function
    "hv" 'counsel-describe-variable
    "hk" 'describe-key
    "el" 'flymake-show-buffer-diagnostics
    )
)

;; for vimursor status in terminal
(use-package evil-terminal-cursor-changer
  :defer t
  :init (evil-terminal-cursor-changer-activate)
)

;; use * to search next word that the cursor pointer
(use-package evil-anzu
  :after evil
  :ensure t
  :diminish
  :demand t
  :init
  (global-anzu-mode t))

(use-package evil-surround
  ;; cs"': "hello" => 'hello'
  ;; cst": <q>hello</q> => "hello"
  ;; ysiw]: hello => [hello]
  ;; yssb & yss: wrap the entire line with ()
  ;; Revert to the original text: ds{ds)
  ;; Emphasize hello: ysiw<em>: <em>Hello</em> world!
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :demand t
  :config
  (setq evil-collection-mode-list (remove 'lispy evil-collection-mode-list))
  (evil-collection-init)

   (cl-loop for (mode . state) in
	    '((org-agenda-mode . normal)
	      ;; (Custom-mode . emacs)
	      (eshell-mode . emacs)
	      (makey-key-mode . motion))
	    do (evil-set-initial-state mode state)))

(use-package evil-snipe
  :diminish
  :init
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-matchit
  ;; use % 
  :init
  (global-evil-matchit-mode 1))

(provide 'init-evil)
