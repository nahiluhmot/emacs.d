;;; init-coffeescript.el

;;; Code:

(use-package coffee-mode
  :ensure t
  :mode "\\.coffee$"
  :init
  (setvar coffee-tab-width 2)
  (setvar coffee-indent-like-python-mode t))

(provide 'init-coffeescript)
