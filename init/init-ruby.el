;;; init-ruby.el

(use-package enh-ruby-mode
  :ensure t
  :mode "\\.rb$"
  :interpreter "ruby"
  :config
  (setq ruby-deep-indent-paren nil)
  (add-hook 'ruby-mode-hook 'rainbow-delimiters-mode))

(provide 'init-ruby)
