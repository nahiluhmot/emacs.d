;;; init-gui.el

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (display-graphic-p)
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize)))

(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil :height 200)
      (use-package doom-themes
        :ensure t)
      (load-theme 'doom-tomorrow-night))
  (use-package ujelly-theme
    :ensure t))

(defun day-mode ()
  "Use a lighter theme for day."
  (interactive)
  (disable-theme 'doom-tomorrow-night)
  (load-theme 'doom-tomorrow-day))

(defun night-mode ()
  "Use a darker theme for night."
  (interactive)
  (disable-theme 'doom-tomorrow-day)
  (load-theme 'doom-tomorrow-night))

(global-set-key (kbd "C-c d") 'day-mode)
(global-set-key (kbd "C-c C-d") 'day-mode)
(global-set-key (kbd "C-c n") 'night-mode)
(global-set-key (kbd "C-c C-n") 'night-mode)

(provide 'init-gui)
