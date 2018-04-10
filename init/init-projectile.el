;;; init-projectile.el

(use-package projectile
  :ensure t
  :config
  (setvar projectile-indexing-mode 'alien)
  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :init
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(use-package helm-ag
  :ensure t)

(provide 'init-projectile)
