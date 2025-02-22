;;; init-typescript.el

(defun init-tide-mode ()
  "Hooks for tide-mode."
  (tide-setup)
  (add-hook 'before-save-hook 'tide-format-before-save))

(use-package typescript-mode
  :ensure t
  :mode ("\\.\\(ts\\|tsx\\)\\'" . typescript-mode))

(use-package tide
  :ensure t
  :init
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil :tabSize 2 :indentSize 2))
  (setq typescript-indent-level 2)
  (add-hook 'typescript-mode-hook 'tide-mode)
  (add-hook 'typescript-mode-hook 'prettier-mode)
  (add-hook 'typescript-mode-hook 'rainbow-delimiters-mode))

(provide 'init-typescript)
