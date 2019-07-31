;;; init-centaur.el

(use-package centaur-tabs
  :ensure t
  :bind
  ("C-c ," . centaur-tabs-backward)
  ("C-c ." . centaur-tabs-forward)
  :config
  (setq centaur-tabs-set-icons t))

(add-hook 'after-init-hook 'centaur-tabs-mode)

(provide 'init-centaur)
