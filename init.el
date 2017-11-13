;;; init.el

;;; Commentary:

;; All actual configuration lives in ~/.emacs.d/lisp/

;;; Code:

(require 'package)

(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.milkbox.net/packages/")))
(package-initialize)

;;; Files which require no external packages.
(load-file "~/.emacs.d/lisp/core.el")
(load-file "~/.emacs.d/lisp/jenkins.el")
(load-file "~/.emacs.d/lisp/github.el")
(load-file "~/.emacs.d/lisp/copy-paste.el")
(load-file "~/.emacs.d/lisp/zap.el")

;;; External package dependent configuration.
(load-file "~/.emacs.d/lisp/package-config.el")
(load-file "~/.emacs.d/lisp/themes.el")

; This is objectively annoying in init.el
(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

(provide 'init)
