;;; copy-paste.el --- copy to and paste from system clipboard

;;; Code:

(defun pbcopy (start end)
  "Copy the region form START to END into the system copy buffer."
  (interactive "r")
  (shell-command-on-region start end "pbcopy"))
(defun pbpaste ()
  "Paste the system copy buffer."
  (interactive)
  (insert (shell-command-to-string "pbpaste")))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)

(provide 'init-copy-paste)
