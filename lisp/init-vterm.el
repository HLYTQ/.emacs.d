;;; init-vterm.el --- Initialize vterm configurations. -*- lexical-binding: t; -*-

(use-package vterm
  :defer t
  :config
  (setq vterm-shell "zsh")
  (setq vterm-kill-buffer-on-exit t)
)

(use-package vterm-toggle
  :defer t
  :bind (([f2] . vterm-toggle-cd))
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                ;;(direction . bottom)
                ;;(dedicated . t) ;dedicated is supported in emacs27
                (reusable-frames . visible)
                (window-height . 0.3)))
)

;; ;Switch to next vterm buffer
;; (define-key vterm-mode-map (kbd "s-n")   'vterm-toggle-forward)
;; ;Switch to previous vterm buffer
;; (define-key vterm-mode-map (kbd "s-p")   'vterm-toggle-backward)

(provide 'init-vterm)
