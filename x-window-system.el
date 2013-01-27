; tool-bar, menubar を消す
; (tool-bar-mode 0)
(menu-bar-mode 0)

(line-number-mode t)
(column-number-mode t)

;;; モードラインの設定(空白除去)
;;; 徹底的にsmartに！
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

;; 曜日表示
(defconst dayname-to-youbi
  '(("Mon" . "月")("Tue" . "火")("Wed" . "水")("Thu" . "木")
    ("Fri" . "金")("Sat" . "土")("Sun" . "日")))
(setq display-time-string-forms
      '((format "%s月%s日(%s)%s:%s"
		month day (cdr (assoc dayname dayname-to-youbi))
		12-hours minutes)))

;; モードラインのファイル名をパスから表示
;(add-hook 'find-file-hooks
;'(lambda ()
; (setq mode-line-buffer-identification 'buffer-file-truename)))
