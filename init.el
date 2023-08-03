;;; init.el -- Custom configuration

;;; Commentary:

;; All actual configuration lives in ~/.emacs.d/init/

;;; Code:

(require 'package)

(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

; Core config.
(require 'init-core)

; Many languages use rainbow delims.
(require 'init-rainbow)

; Additional config, listed in alphabetical order.

(require 'init-coffeescript)
(require 'init-company)
(require 'init-copy-paste)
(require 'init-csv)
(require 'init-diff-hl)
(require 'init-elisp)
(require 'init-elm)
(require 'init-evil)
(require 'init-file-name-copy)
(require 'init-flycheck)
(require 'init-github)
(require 'init-go)
(require 'init-golden-ratio)
(require 'init-gui)
(require 'init-haskell)
(require 'init-javascript)
(require 'init-magit)
(require 'init-markdown)
(require 'init-projectile)
(require 'init-smartparens)
(require 'init-ruby)
(require 'init-rust)
(require 'init-tmux)
(require 'init-transpose-superword)
(require 'init-typescript)
(require 'init-web)
(require 'init-yaml)
(require 'init-zap)

(require 'init-centaur)

(provide 'init)
;;; init.el ends here
(put 'set-goal-column 'disabled nil)
