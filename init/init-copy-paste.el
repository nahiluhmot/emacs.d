;;; copy-paste.el --- copy to and paste from system clipboard

;;; Code:

(defun init-pbcopy (start end)
  "Copy the region form START to END into the system copy buffer."
  (interactive "r")
  (shell-command-on-region start end "pbcopy"))
(defun init-pbpaste ()
  "Paste the system copy buffer."
  (interactive)
  (insert (shell-command-to-string "pbpaste")))

(global-set-key (kbd "C-c c") 'init-pbcopy)
(global-set-key (kbd "C-c v") 'init-pbpaste)

(provide 'init-copy-paste)
