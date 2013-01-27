;; by Satoru Takabayashi
;; �Խ���Υե�����򳫤�ľ��
;; - yes/no �γ�ǧ������ 
;;   - revert-buffer �� yes/no �γ�ǧ�����뤵��
;; - �֤��ޤä�!�פȤ����Ȥ��˥���ɥ��Ǹ��ΥХåե��ξ��֤�����
;;   - find-alternate-file �ϳ���ľ�����鸵�ΥХåե��ξ��֤����ʤ�
;;
(defun reopen-file ()
  (interactive)
  (let ((file-name (buffer-file-name))
	(old-supersession-threat
	  (symbol-function 'ask-user-about-supersession-threat))
	(point (point)))
    (when file-name
      (fset 'ask-user-about-supersession-threat (lambda (fn)))
      (unwind-protect
	    (progn
	          (erase-buffer)
		      (insert-file file-name)
		          (set-visited-file-modtime)
			      (goto-char point))
	(fset 'ask-user-about-supersession-threat 
	            old-supersession-threat)))))
;(define-key ctl-x-map "\C-r"  'reopen-file)
(global-set-key "\C-r" 'reopen-file)

;; Don't make backup files
(setq make-backup-files nil)

;; Save Automatically
;; auto-save-buffers ���оݤȤ���ե����������ɽ��
(defvar auto-save-buffers-regexp ""
  "*Regexp that matches `buffer-file-name' to be auto-saved.")
(defun auto-save-buffers ()
  "Save buffers if `buffer-file-name' matches `auto-save-buffers-regexp'."
  (let ((buffers (buffer-list))
	buffer)
    (save-excursion
      (while buffers
	(set-buffer (car buffers))
	(if (and buffer-file-name
		 (buffer-modified-p)
		 (not buffer-read-only)
		 (string-match auto-save-buffers-regexp buffer-file-name)
		 (file-writable-p buffer-file-name))
              (save-buffer))
	(setq buffers (cdr buffers))))))
(provide 'auto-save-buffers)
(require 'auto-save-buffers)
(run-with-idle-timer 10 t 'auto-save-buffers) ; �����ɥ����(configure me!)

;; Make backupfiles
(defun my-backup-save ()
  (interactive)
  (append-to-file 1 (1+ (buffer-size))
   (expand-file-name
   (concat (buffer-name) "." (format-time-string "%y-%m%d-%H%M%S" (current-time)))
    "~/.emacs-backups/"))
  (save-buffer))
