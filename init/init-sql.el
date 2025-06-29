;;; init-sql.el --- SQL configuration

(use-package sqlformat
  :ensure t
  :mode ("\\.sql$")
  :config
  (setq sqlformat-command 'sqlfmt))

(provide 'init-sql)
