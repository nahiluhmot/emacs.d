;;; package-config.el --- package manager configuration

;;; Code:

; Install use-packge.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; Dependencies, listed alphabetically.

(use-package coffee-mode
  :ensure t
  :mode "\\.coffee$"
  :init
  (setq coffee-tab-width 4)
  (setq coffee-indent-like-python-mode t))

(use-package evil
  :ensure t
  :bind (:map evil-insert-state-map
              ("C-n" . evil-normal-state))
  :init
  (evil-mode 1)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  :config
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'magit-mode 'emacs)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'magit-blame-mode 'emacs)
  (evil-set-initial-state 'package-menu-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'emacs))

(use-package go-mode
  :ensure t)

(use-package helm
  :ensure t)

(use-package helm-projectile
  :ensure t
  :init
  (helm-projectile-on))

(use-package magit
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode "\\.md$")

(use-package projectile
  :ensure t
  :config
  (setq projectile-indexing-mode 'alien)
  (projectile-global-mode))

(use-package rainbow-delimiters
  :ensure t)

(use-package ruby-mode
  :ensure t
  :mode "\\.rb$"
  :interpreter "ruby"
  :config
  (setq ruby-deep-indent-paren nil)
  (add-hook 'ruby-mode-hook 'rainbow-delimiters-mode))

(use-package ujelly-theme
  :ensure t)

(use-package web-mode
  :ensure t
  :mode ("\\.jsx$" "\\.hbs$")
  :config
  (defun my-web-mode-hook ()
    "Hooks for web-mode."
    (setq web-mode-markup-indent-offset 2))
  (add-hook 'web-mode-hook 'my-web-mode-hook))

(use-package yaml-mode
  :ensure t)

(provide 'package-config)
