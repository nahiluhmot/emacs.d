;;; init-haskell.el

(use-package haskell-mode
  :ensure t
  :init
  (add-hook 'haskell-mode-hook 'rainbow-delimiters-mode))

(custom-set-variables
 '(haskell-stylish-on-save t))

(provide 'init-haskell)
