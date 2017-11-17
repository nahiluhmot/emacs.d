;;; init-ruby.el

(defun my-ruby-mode-hook ()
  "Called when initializing ruby."
  (setenv "RBENV_VERSION" "2.4.1"))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)

(provide 'init-ruby)
