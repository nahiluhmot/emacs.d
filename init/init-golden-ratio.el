;;; init-golden-ratio.el

(use-package golden-ratio
  :ensure t
  :bind ("C-c C-r" . golden-ratio-mode)
  :config
  (golden-ratio-mode 1))

(provide 'init-golden-ratio)
