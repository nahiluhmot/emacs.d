;;; init-haskell.el

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-enable-snippet nil))

(use-package lsp-ui
  :ensure t
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-haskell
  :ensure t)

(use-package haskell-mode
  :ensure t
  :init
  (setq lsp-haskell-process-path-hie "hie-wrapper")
  (setq lsp-prefer-flymake nil)
  (add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'haskell-mode-hook #'lsp))

(custom-set-variables
 '(haskell-stylish-on-save t))

(provide 'init-haskell)
