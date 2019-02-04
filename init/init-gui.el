;;; init-gui.el

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (display-graphic-p)
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize)))

(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil :height 180)
      (use-package doom-themes
        :ensure t)
      (load-theme 'doom-tomorrow-night))
  (use-package ujelly-theme
    :ensure t))

(provide 'init-gui)
