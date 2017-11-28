;;; github.el --- github shell commands

;;; Code:

(defun init-hub-browse ()
  "Open the current repo in GitHub."
  (interactive)
  (shell-command "hub browse"))

(global-set-key (kbd "C-c h b") 'init-hub-browse)

(provide 'init-github)
