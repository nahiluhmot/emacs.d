;;; init-ruby.el

(defun init-ruby-mode ()
  "Called when initializing ruby."
  (setenv "RBENV_VERSION" "2.4.1"))

(add-hook 'ruby-mode-hook 'init-ruby-mode)
(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)

(provide 'init-ruby)
