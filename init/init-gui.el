;;; init-gui.el

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (display-graphic-p)
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize)))

(when (display-graphic-p)
  (set-face-attribute 'default nil :height 160))

(provide 'init-gui)
