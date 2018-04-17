;;; transpose-superword.el

(defun init-transpose-superword ()
  "Transpose the current and previous superwords"
  (interactive)
  (superword-mode 1)
  (transpose-words 1)
  (superword-mode -1))

(global-set-key (kbd "M-T") 'init-transpose-superword)
