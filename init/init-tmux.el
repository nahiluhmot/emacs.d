;;; init-tmux -- focus tmux pane for current projectile project
;;;
;;; Commentary:
;;; I can't believe Emacs wants me to do this.
;;;
;;; Code:

;; Dependencies

(require 'projectile)
(require 's)

;; Data structures

; tmux-session

(defun init-tmux-session-alloc (name attached)
  "Allocate a new tmux session structure in memory with a NAME and ATTACHED status."
  `(tmux-session ,name ,attached))

(defun init-tmux-session-name (tmux-session)
  "Retrieve the name of TMUX-SESSION."
  (nth 1 tmux-session))

(defun init-tmux-session-attached (tmux-session)
  "Test whether TMUX-SESSION is an attached session."
  (nth 2 tmux-session))

(defun init-tmux-session-format (tmux-session)
  "Return a formatted string for the TMUX-SESSION."
  (let* ((name (init-tmux-session-name tmux-session))
         (attached (init-tmux-session-attached tmux-session))
         (prefix (if attached "* " "  ")))
    (concat prefix name)))

; tmux-client

(defun init-tmux-client-alloc (tty session-name)
  "Create a new tmux-client from TTY and SESSION-NAME."
  `(tmux-client ,tty ,session-name))

(defun init-tmux-client-tty (tmux-client)
  "Get the tty from TMUX-CLIENT."
  (nth 1 tmux-client))

(defun init-tmux-client-session-name (tmux-client)
  "Get the session-name from TMUX-CLIENT."
  (nth 2 tmux-client))

(defun init-tmux-client-format (tmux-client)
  "Return a formatted string for TMUX-CLIENT."
  (concat (init-tmux-client-tty tmux-client)
          ": "
          (init-tmux-client-session-name tmux-client)))

;; Utility

(defun init-tmux-shell-command (&rest args)
  "Run the tmux executable with ARGS.  If the command exits zero, return `stdout' and `stderr'.  Otherwise, raise an error."
  (let* ((buffer-name (concat "*init-tmux-"
                              (number-to-string (round (time-to-seconds (current-time))))
                              "-"
                              (number-to-string (random))
                              "*"))
         (buffer (generate-new-buffer buffer-name))
         (result (apply 'call-process `("tmux" nil ,buffer nil ,@args)))
         (output (with-current-buffer buffer (buffer-string))))
    (kill-buffer buffer)
    (if (= result 0)
        output
      (error "Unable to execute `tmux' subcommand with arguments: %s\n%s" args output))))

(defun init-tmux-list-sessions ()
  "List all tmux sessions."
  (mapcar
   (lambda (line)
     (let ((name (car (s-split-up-to ":" line 1)))
           (attached (s-ends-with? "(attached)" line)))
       (init-tmux-session-alloc name attached)))
   (mapcar 's-chomp (s-lines (s-chomp (init-tmux-shell-command "ls"))))))

(defun init-tmux-list-clients ()
  "List all tmux clients."
  (mapcar
   (lambda (line)
     (let ((tty (car (s-split-up-to ":" line 1)))
           (session-name (nth 1 (s-split-up-to " " line 2))))
       (init-tmux-client-alloc tty session-name)))
   (seq-filter (lambda (line) (> (length line) 0))
               (mapcar 's-chomp
                       (s-lines (init-tmux-shell-command "list-clients"))))))

(defun init-tmux-switch-client (client-name session-name)
  "Switch CLIENT-NAME to SESSION-NAME."
  (init-tmux-shell-command "switch-client"
                           "-c" client-name
                           "-t" session-name))

(defun init-tmux-new-session (session-name session-dir)
  "Create a new session named SESSION-NAME starting in SESSION-DIR."
  (init-tmux-shell-command "new-session"
                           "-s" session-name
                           "-c" session-dir
                           "-d"))

(defun init-tmux-find-or-create-session-for-client (client session-name session-dir)
  "Switch CLIENT to SESSION-NAME, creating a new session in SESSION-DIR if id doesn't already exist."
  (let* ((sessions (init-tmux-list-sessions))
         (session-names (mapcar 'init-tmux-session-name sessions))
         (tty (init-tmux-client-tty client)))
    (unless (seq-contains session-names session-name)
      (init-tmux-new-session session-name session-dir))
    (init-tmux-switch-client tty session-name)))

(defun init-tmux-choose-disconnected-client (clients session-name)
  "Chose a client from CLIENTS which is not connected to SESSION-NAME, prompting for user input if needed."
  (let* ((matching-session-name? (lambda (client)
                                   (string= session-name
                                            (init-tmux-client-session-name client))))
         (possible-clients (seq-remove matching-session-name? clients)))
    (cond ((= (length clients) 0)
           (error "No ttys are connected to tmux"))
          ((= (length possible-clients) 0)
           (message "All ttys are connected to %s" session-name)
           nil)
          ((= (length possible-clients) 1)
           (car possible-clients))
          (t
           (let* ((prompt (format "Please select a tty to connect to %s: " session-name))
                  (options (mapcar 'init-tmux-client-tty possible-clients))
                  (selected-tty (completing-read prompt options nil t))
                  (matching-tty? (lambda (client)
                                   (string= selected-tty
                                            (init-tmux-client-tty client)))))
             (seq-find matching-tty? possible-clients))))))

;; UI

(defun init-tmux-ls ()
  "List all tmux sessions."
  (interactive)
  (message (s-join "\n"
                   (mapcar 'init-tmux-session-format
                           (init-tmux-list-sessions)))))

(defun init-tmux-lc ()
  "List all tmux clients."
  (interactive)
  (message (s-join "\n"
                   (mapcar 'init-tmux-client-format
                           (init-tmux-list-clients)))))

(defun init-tmux-focus-current-project ()
  "Focus the current projectile project in tmux."
  (interactive)
  (let* ((session-name (s-replace-all '((" " . "-") ("." . "-"))
                                      (projectile-project-name)))
         (session-dir (s-chop-suffix "/"
                                     (projectile-project-root)))
         (clients (init-tmux-list-clients))
         (chosen-client (init-tmux-choose-disconnected-client clients session-name)))
    (when chosen-client
      (init-tmux-find-or-create-session-for-client chosen-client
                                                   session-name
                                                   session-dir)
      (message "Switched %s to %s" (init-tmux-client-tty chosen-client) session-name))))

(global-set-key (kbd "C-c p .") 'init-tmux-focus-current-project)
(add-hook 'projectile-after-switch-project-hook 'init-tmux-focus-current-project)

(provide 'init-tmux)
;;; init-tmux ends here
