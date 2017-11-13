;;; core.el --- core configuration

;;; Commentary:

;; Basic configuration that applies to emacs as a whole goes here.
;; Note that packages have yet to be loaded at this point.

;;; Code:

;; Basic stuff

; Remove the training wheels!
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; Line numbers.
(global-linum-mode t)
(column-number-mode t)

;; Variables

; Real time saver.
(fset 'yes-or-no-p 'y-or-n-p)
; Computers are fast.
(setq gc-cons-threshold 50000000)
; Auto insert newlines.
(setq require-final-newline t)
; Bells are annoying.
(setq ring-bell-function 'ignore)
; Splash-free.
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
; Live on the wild side.
(setq make-backup-files nil)
(setq auto-save-default nil)
; Who wants this right next to your text?
(setq linum-format " %d ")
;; Spaces > Tabs.
(setq-default indent-tabs-mode nil)

;; Hooks

; This is just good.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keys

;; Modify initialization
(defun modify-init ()
  "Open init.el to edit it."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c I") 'modify-init)

; Enable regex search by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

; This is just a nice key binding.
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(provide 'core)
