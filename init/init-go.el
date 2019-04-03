;;; init-go.el

(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (flycheck-disable-checker 'go-vet))

(use-package company-go
  :ensure t)


(provide 'init-go)
