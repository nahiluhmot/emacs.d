;;; jenkins.el --- jenkins shell commands

;;; Code:

(defun init-jenkins-build ()
  "Start a jenkins build for the current repo."
  (interactive)
  (shell-command "jenkins-build"))

(defun init-jenkins-show ()
  "Open jenkins for the current repo."
  (interactive)
  (shell-command "jenkins-show"))

(global-set-key (kbd "C-c j b") 'init-jenkins-build)
(global-set-key (kbd "C-c j s") 'init-jenkins-show)

(provide 'init-jenkins)
