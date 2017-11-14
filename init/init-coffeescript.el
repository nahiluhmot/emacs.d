;;; init-coffeescript.el

;;; Code:

(use-package coffee-mode
  :ensure t
  :mode "\\.coffee$"
  :init
  (setq coffee-tab-width 4)
  (setq coffee-indent-like-python-mode t))

(provide 'init-coffeescript)
