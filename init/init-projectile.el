;;; init-projectile.el

(use-package projectile
  :ensure t
  :init
  :config
  (setvar projectile-indexing-mode 'alien)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode))


(use-package helm-projectile
  :ensure t
  :init
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(use-package helm-ag
  :ensure t)

(provide 'init-projectile)
