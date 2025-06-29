;;; init-projectile.el

(use-package ivy
  :ensure t
  :init
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package projectile
  :ensure t
  :config
  (setvar projectile-indexing-mode 'alien)
  (setvar projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode)
  (projectile-load-known-projects))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
