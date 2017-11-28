;;; init-gui.el

(when (display-graphic-p)
  (set-face-attribute 'default nil :height 160)
  (use-package spacemacs-theme
    :ensure t
    :init
    (load-theme 'spacemacs-light))
  (use-package exec-path-from-shell
    :ensure t
    :init
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize)))

(provide 'init-gui)
