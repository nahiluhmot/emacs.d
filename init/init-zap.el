;;; zap.el --- key binding to zap up to the given character

;;; Code:

(defun zap-up-to-char (n char)
  "Zap up to N occurrences of the given CHAR."
  (interactive "P\ncZap up to char:")
  (let* ((modifier (if (eq (char-after) char) '1+ 'identity))
         (number (or n 1))
         (start (point))
         (end (save-excursion
                (search-forward (char-to-string char) nil t (funcall modifier number)))))
    (cond ((not end)
           (cond ((= number 1) (error "No occurrences of '%c' after the point." char))
                 ((= number -1) (error "No occurrences of '%c' before the point." char))
                 ((> number 1) (error "Less than %d occurrences of '%c' after the point." number char))
                 ((< number 1) (error "Less than %d occurrences of '%c' before the point." (abs number) char))))
          ((< start end) (kill-region start (1- end)))
          ((> start end) (kill-region start (1+ end))))))

(global-set-key (kbd "M-Z") 'zap-up-to-char)

(provide 'init-zap)
