;;; init-web.el

;;; Code:

(defun my-web-mode-hook ()
  "Hooks for web-mode."
  (setq web-mode-markup-indent-offset 2))

(use-package web-mode
  :ensure t
  :mode ("\\.jsx$" "\\.hbs$")
  :config
  (add-hook 'web-mode-hook 'my-web-mode-hook))

(provide 'init-web)
