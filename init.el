;;; init.el

;;; Commentary:

;; All actual configuration lives in ~/.emacs.d/lisp/

;;; Code:

(require 'package)

(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.milkbox.net/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init/")

;;; Files which require no external packages.
(require 'init-core)
(require 'init-jenkins)
(require 'init-github)
(require 'init-copy-paste)
(require 'init-zap)

;;; External package dependent configuration.
(require 'init-package-config)
(require 'init-themes)

; This is objectively annoying in init.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
