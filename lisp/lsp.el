;;; lsp.el --- Initialize lsp configurations. -*- lexical-binding: t; -*-

(use-package eglot
  :ensure t
  :hook ((c-mode
          c++-mode
          go-mode
          python-mode) . eglot-ensure)
  :bind (("<f12>" . xref-find-definitions)
         ("M-[" . xref-go-back)
         ("C-c e f" . #'eglot-format)
         ("C-c e a" . #'eglot-code-actions)
         ("C-c e i" . #'eglot-code-action-organize-imports)
         ("C-c e q" . #'eglot-code-action-quickfix))
  :config
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "clangd-15")))
;; use bear and clangd for c++

;; flymake
(use-package flymake
  :hook ((prog-mode . flymake-mode))
  :config
  (global-set-key (kbd "M-n") #'flymake-goto-next-error)
  (global-set-key (kbd "M-p") #'flymake-goto-prev-error)
  (setq flymake-no-changes-timeout nil)
  ;;(add-hook 'flymake-diagnostics-buffer-mode-hook
  ;;          (lambda ()
  ;;            (define-key evil-normal-state-local-map (kbd "RET") 'flymake-show-diagnostic)
  ;;            (define-key evil-normal-state-local-map (kbd "TAB") 'flymake-show-diagnostic)
  ;;            ))
  )

;; Rely on pyflakes and rope, use "sudo pip" to install
(use-package flymake-python-pyflakes
  :ensure t
  :hook (python-mode . flymake-python-pyflakes-load))


(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
                company-show-quick-access t
                company-idle-delay 0
                company-echo-delay 0)
  (add-hook 'eshell-mode-hook (lambda () (company-mode -1))))

(use-package tree-sitter
  :config
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :config
  (add-hook 'python-mode-hook #'tree-sitter-hl-mode)
  (add-hook 'c++-mode-hook #'tree-sitter-hl-mode)
  (add-hook 'go-mode-hook #'tree-sitter-hl-mode))

(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
	 (org-mode . yas-minor-mode))
  :init
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (progn
    (setq hippie-expand-try-functions-list
	  '(yas/hippie-try-expand
	    try-complete-file-name-partially
	    try-expand-all-abbrevs
	    try-expand-dabbrev
	    try-expand-dabbrev-all-buffers
	    try-expand-dabbrev-from-kill
	    try-complete-lisp-symbol-partially
	    try-complete-lisp-symbol))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package quickrun
  :ensure t
  :commands (quickrun)
  :init
  (quickrun-add-command "c++/c1z"
                        '((:command . "g++")
	                        (:exec . ("%c -std=c++1z %o -o %e %s"
		                                "%e %a"))
	                        (:remove . ("%e")))
                        :default "c++"))

(use-package go-mode)
(use-package markdown-mode)
(use-package python-mode)
(use-package cmake-mode)
(use-package glsl-mode)

(provide 'lsp)
