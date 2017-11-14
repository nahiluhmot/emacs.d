;;; init-evil.el

;;; Code:

(use-package evil
  :ensure t
  :bind (:map evil-insert-state-map
              ("C-n" . evil-normal-state))
  :bind (:map evil-normal-state-map
              ("C-t" . transpose-chars))
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (evil-mode 1)
  :config
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'magit-mode 'emacs)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'magit-blame-mode 'emacs)
  (evil-set-initial-state 'package-menu-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'emacs))

(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode 1))

(provide 'init-evil)
