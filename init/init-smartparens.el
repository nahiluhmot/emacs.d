;;; init-smartparens.el

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (define-key smartparens-mode-map (kbd "C-c u") 'sp-unwrap-sexp)
  (define-key smartparens-mode-map (kbd "C-c r") 'sp-rewrap-sexp)
  (smartparens-global-mode 1))

(provide 'init-smartparens)
