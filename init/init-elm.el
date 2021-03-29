;;; init-elm.el

(use-package elm-mode
  :ensure t
  :init
  (add-hook 'elm-mode-hook 'lsp))

(custom-set-variables
 '(elm-format-on-save t))

(provide 'init-elm)
