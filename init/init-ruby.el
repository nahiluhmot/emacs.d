;;; init-ruby.el

(defun my-ruby-mode-hook ()
  "Called when initializing ruby."
  (setenv "RBENV_VERSION" "2.4.1"))

(use-package enh-ruby-mode
  :ensure t
  :mode "\\.rb$"
  :interpreter "ruby"
  :config
  (setq ruby-deep-indent-paren nil)
  (add-hook 'enh-ruby-mode-hook 'my-ruby-mode-hook)
  (add-hook 'enh-ruby-mode-hook 'rainbow-delimiters-mode))

(provide 'init-ruby)
