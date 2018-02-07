;;; init-web.el

;;; Code:

(defun init-web-mode ()
  "Hooks for web-mode."
  (setvar web-mode-markup-indent-offset 2)
  (setvar web-mode-code-indent-offset 2)
  (setq indent-tabs-mode nil))

(use-package web-mode
  :ensure t
  :mode ("\\.jsx$" "\\.hbs$")
  :config
  (add-hook 'web-mode-hook 'init-web-mode))

(provide 'init-web)
