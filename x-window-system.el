; tool-bar, menubar ��ä�
; (tool-bar-mode 0)
(menu-bar-mode 0)

(line-number-mode t)
(column-number-mode t)

;;; �⡼�ɥ饤�������(�������)
;;; Ű��Ū��smart�ˡ�
;;; http://homepage1.nifty.com/blankspace/emacs/mode-line.html
;(setq-default mode-line-format
;              '("-"
;                mode-line-mule-info
;                mode-line-modified
;                mode-line-frame-identification
;                mode-line-buffer-identification
;                " "
;                global-mode-string
;                " %[("
;                mode-name
;                mode-line-process
;                minor-mode-alist
;                "%n" ")%]-"
;                (which-func-mode ("" which-func-format "-"))
;                (line-number-mode "L%l-")
;                (column-number-mode "C%c-")
;                (-3 . "%p")
;                "-%-")
;              )

;; ����ɽ��
(defconst dayname-to-youbi
  '(("Mon" . "��")("Tue" . "��")("Wed" . "��")("Thu" . "��")
    ("Fri" . "��")("Sat" . "��")("Sun" . "��")))
(setq display-time-string-forms
      '((format "%s��%s��(%s)%s:%s"
		month day (cdr (assoc dayname dayname-to-youbi))
		12-hours minutes)))

;; �⡼�ɥ饤��Υե�����̾��ѥ�����ɽ��
;(add-hook 'find-file-hooks
;'(lambda ()
; (setq mode-line-buffer-identification 'buffer-file-truename)))
