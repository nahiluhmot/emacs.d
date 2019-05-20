;;; init-flycheck.el

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

; https://github.com/flycheck/flycheck/issues/1523
(setq-default flycheck-disabled-checkers '(go-vet ruby-rubocop))

(provide 'init-flycheck)
