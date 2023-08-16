;;; defun.el --- Initialize defun configurations. -*- lexical-binding: t; -*-

(defun f-switch-to-buffer (dir)
  (unless (minibufferp)
    (let ((bn (buffer-name))
	  (name (if (> dir 0) 'switch-to-next-buffer 'switch-to-prev-buffer))
          (active-buffers (mapcar 'window-buffer (window-list)))
          buffer p)
      (funcall name)
      (while (not p)
        (setq buffer (current-buffer))
        (if (or buffer-file-name
                (not buffer-read-only)
                (get-buffer-process buffer)
                (cl-position buffer active-buffers)
                (string= bn (buffer-name)))
            (setq p t)
          (kill-buffer)
          (funcall name))))))

(defun c-switch-to-next-buffer ()
  (interactive)
  (f-switch-to-buffer 1))

(defun c-switch-to-prev-buffer ()
  (interactive)
  (f-switch-to-buffer 0))

(defun insert-current-date ()
  "insert date where cursor on"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun insert-current-time ()
  "insert time where cursor on"
  (interactive)
  (insert (format-time-string "%H:%M:%S")))

(defun toggle-letter-case ()
  "toggles the case of the word where the cursor is located"
  (interactive)
  (if (region-active-p)
      (call-interactively 'upcase-region)
    (if (looking-at-p "\\sw")
	(capitalize-word 1)
      (downcase-word 1))))

(defun toggle-terminal ()
  (interactive)
  (progn
    (split-window-below)
    (other-window 1)
    (window-resize (selected-window) -5)
    (eshell)))

(defun delete-pair-self()
  (interactive)
  (unless (eq ?\( (char-syntax) (delete-char -1))
    (backward-up-list))
  (save-excursion (forward-sexp) (delete-char -1))
  (delete-char 1))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (split-line))

(defun open-line-below (&optional arg interactive)
  (interactive "*P\np")
  (end-of-line)
  (newline arg interactive))

(defun save-and-exit ()
  "save and Exit."
  (interactive)
  (save-some-buffers t)
  (kill-emacs))

;; 第一个参数表示聚焦在窗口时的透明度，第二个表示离开的。如果是arch系
;; 的可以方便的安装emasc-git来实现真背景透明不过这是mint
(setq alpha-list '((90 90) (85 55) (65 45) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

(defun open-config-file ()
  "use counsel-find-file to my config directory"
  (interactive)
  (counsel-find-file "~/.emacs.d/lisp/"))

(defun copy-line-or-region ()
  "copy line when no region"
  (interactive)
  (if mark-active (kill-ring-save
                   (region-beginning) (region-end))
      (progn
        (kill-ring-save (line-beginning-position) (line-end-position))
        (message "copy thie line"))
    )
  )

(defun kill-line-or-region ()
  "kill line when no region"
  (interactive)
  (if mark-active (kill-region
                   (region-beginning) (region-end))
    (progn
      (beginning-of-line)
      (kill-line)
      (message "kill this line "))
    )
  )

(defun set-emacs-key ()
  "let Capslock as Ctrl"
  (interactive)
  (shell-command "bash ~/Public/scripts/setxkbemasc.sh &")
)

(defun set-evil-key ()
  "let Caplock as Ctrl"
  (interactive)
  (shell-command "bash ~/Public/scripts/setxkbevil.sh &")
)

(defun w-resize-left ()
  "Increase current window height by COUNT."
  (interactive)
  (window-resize (selected-window)  -10 t t))

(defun w-resize-large ()
  "Decrease current window height by COUNT."
  (interactive)
  (window-resize (selected-window)  -6 nil t))

(defun w-resize-up ()
  "Increase current window width by COUNT."
  (interactive)
  (window-resize (selected-window)  6 nil t))

(defun w-resize-right ()
  "Decrease current window width by COUNT."
  (interactive)
  (window-resize (selected-window)  10 t t))

(defun self-add-window-margins ()
  "add window margins."
  (interactive)
  (progn
    (setq left-margin-width 40)
    (setq right-margin-width 40))
)

(provide 'defun)
