;;; init-core.el --- core configuration

;;; Commentary:

;; Basic configuration that applies to Emacs as a whole goes here.
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

;; Better defvar.

(defmacro setvar (symbol &optional initval docstring)
  "Like defvar SYMBOL INITVAL DOCSTRING, but will setq the variable if it's already defined."
  (if (boundp symbol)
      `(setq ,symbol ,initval)
    `(defvar ,symbol ,initval ,docstring)))

;; Variables

; Real time saver.
(fset 'yes-or-no-p 'y-or-n-p)
; Computers are fast.
(setvar gc-cons-threshold 50000000)
; Auto insert newlines.
(setvar require-final-newline t)
; Bells are annoying.
(setvar ring-bell-function 'ignore)
; Splash-free.
(setvar inhibit-splash-screen t)
(setvar inhibit-startup-message t)
; Live on the wild side.
(setvar make-backup-files nil)
(setvar auto-save-default nil)
(setq linum-format " %d ")
; Spaces > Tabs.
(setq-default indent-tabs-mode nil)
; Enable up/down case.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Hooks

; This is just good.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keys

; Enable regex search by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

; This is just a nice key binding.
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

; Install use-packge.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; Only add melpa unstable after use package is installed.
(add-to-list 'package-archives '("melpa-unstable" . "https://melpa.org/packages/"))

(eval-when-compile
  (require 'use-package))

; This is objectively annoying in init.el
(setvar custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'tramp)

(provide 'init-core)
;;; init-core.el ends here
