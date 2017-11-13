;;; init.el

;;; Commentary:

;; All actual configuration lives in ~/.emacs.d/lisp/

;;; Code:

(require 'package)

(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.milkbox.net/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;; Files which require no external packages.
(load-file "~/.emacs.d/lisp/core.el")
(load-file "~/.emacs.d/lisp/jenkins.el")
(load-file "~/.emacs.d/lisp/github.el")
(load-file "~/.emacs.d/lisp/zap.el")

;;; External package dependent configuration.
(load-file "~/.emacs.d/lisp/package-config.el")
(load-file "~/.emacs.d/lisp/themes.el")

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-projectile helm web-mode use-package ujelly-theme rainbow-delimiters projectile markdown-mode magit go-mode evil-surround))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
