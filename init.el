;;; init.el

;;; Commentary:

;; All actual configuration lives in ~/.emacs.d/init/

;;; Code:

(require 'package)

(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.milkbox.net/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init/")

; Core config.
(require 'init-core)

; Additional config, listed in alphabetical order.
(require 'init-coffeescript)
(require 'init-copy-paste)
(require 'init-evil)
(require 'init-github)
(require 'init-helm)
(require 'init-jenkins)
(require 'init-magit)
(require 'init-markdown)
(require 'init-projectile)
(require 'init-rainbow)
(require 'init-ruby)
(require 'init-themes)
(require 'init-web)
(require 'init-yaml)
(require 'init-zap)

(provide 'init)
