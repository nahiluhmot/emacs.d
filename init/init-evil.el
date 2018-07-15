;;; init-evil.el

;;; Code:

(use-package evil
  :ensure t
  :bind (:map evil-insert-state-map
              ("C-n" . evil-normal-state))
  :bind (:map evil-normal-state-map
              ("C-t" . transpose-chars))
  :init
  (setvar evil-want-C-u-scroll t)
  (setvar evil-want-C-d-scroll t)
  (evil-mode 1)
  :config
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'inf-ruby-mode 'emacs)
  (evil-set-initial-state 'magit-mode 'emacs)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'magit-blame-mode 'emacs)
  (evil-set-initial-state 'package-menu-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'emacs))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
