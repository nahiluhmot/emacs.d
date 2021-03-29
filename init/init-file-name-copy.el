;;; init-file-name-copy -- copies the current file name to the kill ring.
;;;
;;; Commentary:
;;; I can't believe Emacs wants me to do this.
;;;
;;; Code:

;; Dependencies

(defun init-file-name-copy ()
  "Insert the current file name at the front of the kill ring."
  (interactive)
  (let ((file-name (s-chop-prefix (projectile-project-root) (buffer-file-name))))
    (kill-new file-name)
    (message "Copied %s to the kill ring" file-name)))

(global-set-key (kbd "C-c f") 'init-file-name-copy)

(provide 'init-file-name-copy)
;;; init-file-name-copy.el ends here
