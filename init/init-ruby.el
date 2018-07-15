;;; init-ruby.el

(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode))

(use-package rbenv
  :ensure t
  :init
  (setq rbenv-executable "/usr/local/bin/rbenv")
  :config
  (global-rbenv-mode))

(provide 'init-ruby)
