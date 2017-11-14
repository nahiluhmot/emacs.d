;;; jenkins.el --- jenkins shell commands

;;; Code:

(defun jenkins-build ()
  "Start a jenkins build for the current repo."
  (interactive)
  (shell-command "jenkins-build"))

(defun jenkins-show ()
  "Open jenkins for the current repo."
  (interactive)
  (shell-command "jenkins-show"))

(global-set-key (kbd "C-c j b") 'jenkins-build)
(global-set-key (kbd "C-c j s") 'jenkins-show)

(provide 'init-jenkins)
