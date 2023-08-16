;;; init-search.el --- Initialize search configurations. -*- lexical-binding: t; -*-

(use-package ivy
    :hook (after-init . ivy-mode)
    :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t
          ivy-initial-inputs-alist nil
          ivy-count-format "%d/%d "
          enable-recursive-minibuffers t
          ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
    )

(use-package counsel
    :after (ivy)
    :bind (("M-x" . counsel-M-x)
           ("C-x C-f" . counsel-find-file)
           ("C-c f r" . counsel-recentf)
           ("C-c g" . counsel-git)))

(use-package swiper
    :after ivy
    :bind (("C-s" . swiper)
            ("C-r" . swiper-isearch-backward))
    :config (setq swiper-action-recenter t
                  swiper-include-line-number-in-search t))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package amx
  :after ivy
  :hook (ivy-mode-hook . amx-mode))

(use-package ivy-posframe
  :after ivy
  :init
  (setq ivy-posframe-display-functions-alist
        '((counsel-M-x . ivy-posframe-display-at-frame-center)
          (complete-symbol . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1)
  )

(provide 'init-search)
