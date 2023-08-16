;;; init.el --- init initialization. -*- lexical-binding: t; -*-

;; load my config file path
(add-to-list 'load-path (expand-file-name
			             (concat user-emacs-directory "lisp")))

(require 'modules)
(require 'init-search)
(require 'init-ui)
(require 'init-modeline)
(require 'lsp)
;; (require 'init-evil)
(require 'init-vterm)
(require 'init-dashboard)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil t)
 '(package-selected-packages
   '(nerd-icons doom-modeline ivy-posframe amx hl-todo highlight-indent-guides all-the-icons-ibuffer all-the-icons-ivy-rich all-the-icons-dired rainbow-delimiters ivy-rich counsel ivy which-key evil-matchit evil-snipe evil-collection evil-surround evil-anzu evil-terminal-cursor-changer evil-leader undo-tree evil glsl-mode cmake-mode python-mode markdown-mode go-mode quickrun yasnippet tree-sitter-langs tree-sitter company flymake-python-pyflakes eglot use-package doom-themes))
 '(warning-suppress-log-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
