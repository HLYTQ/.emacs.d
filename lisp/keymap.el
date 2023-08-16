;;; keymap.el --- Initialize keymap configurations. -*- lexical-binding: t; -*-

(global-set-key (kbd "C-c [") 'c-switch-to-prev-buffer)
(global-set-key (kbd "C-c ]") 'c-switch-to-next-buffer)
(global-set-key (kbd "C-c `") 'toggle-letter-case)
(global-set-key (kbd "C-c '") 'toggle-terminal)

;; The two keybind below can't not work on terminal
(global-set-key (kbd "C-S-<return>") 'open-line-above)
(global-set-key (kbd "S-<return>") 'open-line-below)

(global-set-key (kbd "C-x C-c") 'save-and-exit)

(global-set-key (kbd "C-w") 'kill-line-or-region)
(global-set-key (kbd "M-w") 'copy-line-or-region)

(global-set-key [(f8)] 'loop-alpha)
(global-set-key [(f5)] 'gdb)

;; The set of file operation
(define-prefix-command 'file-map)
(global-set-key (kbd "C-c f") 'file-map)
(define-key file-map (kbd "p") 'open-config-file)
(define-key file-map (kbd "g") 'find-file-at-point)

;; Use emacs to look up the dictionary
(define-prefix-command 'dictionary-map)
(global-set-key (kbd "C-c d") 'dictionary-map)
(define-key dictionary-map (kbd "d") 'sdcv-search-pointer+)
(define-key dictionary-map (kbd "i") 'sdcv-search-input+)

(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)

;; org-mode
(global-set-key (kbd "C-c a") 'org-agenda)

;; (global-set-key (kbd "<ESC> g") 'keyboard-escape-quit)

(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(provide 'keymap)
