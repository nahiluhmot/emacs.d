;;; github.el --- github shell commands

;;; Code:

(defun hub-browse ()
  "Open the current repo in GitHub."
  (interactive)
  (shell-command "hub browse"))

(global-set-key (kbd "C-c h b") 'hub-browse)

(provide 'github)
