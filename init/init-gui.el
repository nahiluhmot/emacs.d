;;; init-gui.el

(when (display-graphic-p)
  (set-face-attribute 'default nil :height 160)
  (use-package exec-path-from-shell
    :ensure t
    :init
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize)))

(provide 'init-gui)
