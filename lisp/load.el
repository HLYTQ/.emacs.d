;;; load.el --- Initialize package configurations.	-*- lexical-binding: t -*-

(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; use-package settings
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand t
      use-package-always-minimally t
      use-package-verbose t)

;;个别时候会出现签名检验失败
(setq package-check-signature nil)

;; 初始化软件包管理器
(require 'package)
(unless (bound-and-true-p package--initialized)
    (package-initialize))
;; 刷新软件源索引
;;(unless package-archive-contents
;;    (package-refresh-contents))

;; 第一个扩展插件：use-package，用来批量统一管理软件包
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))


(provide 'load)
