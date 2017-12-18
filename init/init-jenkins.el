;;; jenkins.el --- jenkins shell commands

;;; Code:

(defun init-connect-to-vpn ()
  "Connect to the VPN."
  (shell-command "osascript -e 'tell application \"Viscosity\" to connect \"Upserve\"'"))

(defun init-jenkins-build ()
  "Start a jenkins build for the current repo."
  (interactive)
  (init-connect-to-vpn)
  (shell-command "jenkins-build"))

(defun init-jenkins-show ()
  "Open jenkins for the current repo."
  (interactive)
  (init-connect-to-vpn)
  (shell-command "jenkins-show"))

(global-set-key (kbd "C-c j b") 'init-jenkins-build)
(global-set-key (kbd "C-c j s") 'init-jenkins-show)

(provide 'init-jenkins)
