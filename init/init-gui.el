;;; init-gui.el

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (display-graphic-p)
    (add-hook 'after-init-hook 'exec-path-from-shell-initialize)))

(use-package spacemacs-theme
  :ensure t
  :defer t)
(use-package ujelly-theme
  :ensure t
  :defer t)

(use-package doom-themes
  :ensure t
  :defer t
  :init
  (load-theme 'doom-tomorrow-night))

(when (display-graphic-p)
  (set-face-attribute 'default nil :height 160))

(provide 'init-gui)
