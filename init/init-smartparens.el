;;; init-smartparens.el

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(provide 'init-smartparens)
