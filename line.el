;; �Хåե��κǸ�ιԤ� next-line ���Ƥ⿷�����Ԥ���ʤ�
(setq next-line-add-newlines nil)

;;; �ǽ��Ԥ�ɬ�������������
(setq require-final-newline t)

;;;_+ wb-line-number-mode
;;;   http://homepage1.nifty.com/blankspace/emacs/wb-line-number.html
;(load "~/elisp/line/wb-line-number.el")
; always load
;(require 'wb-line-number)
;(wb-line-number-toggle)
;(setq truncate-partial-width-windows nil)
;(set-scroll-bar-mode nil)
;(setq wb-line-number-scroll-bar t)

;;;_+ physical-line-mode
(load "~/elisp/line/physical-line" )
(physical-line-on)
(setq physical-line-ignoring-mode-list '(dired-mode text-mode))

;;;_+ line-macro
;;;   http://www.ht.sakura.ne.jp/~delmonta/emacs/10.html
;;;(load "~/elisp/line/ds-line")

;----------------- �Хåե��κǽ�ιԤ� previous-line ���Ƥ⡢ ----------------
;-------------- "beginning-of-buffer" ����դ���ʤ��褦�ˤ��롣 --------------
(defun previous-line (arg)
(interactive "p")
(if (interactive-p)
(condition-case nil
(line-move (- arg))
((beginning-of-buffer end-of-buffer)))
(line-move (- arg)))
nil)

;;; �����ζ����������
(goto-char (point-min))
(while (re-search-forward "[ \t]+$" nil t)
(replace-match "" nil nil))


;;; Pager
(load "~/elisp/line/pager")
(global-set-key "\C-v"	   'pager-page-down)
(global-set-key [next] 	   'pager-page-down)
(global-set-key "\ev"	   'pager-page-up)
(global-set-key [prior]	   'pager-page-up)
(global-set-key '[M-up]    'pager-row-up)
(global-set-key '[M-kp-8]  'pager-row-up)
(global-set-key '[M-down]  'pager-row-down)
(global-set-key '[M-kp-2]  'pager-row-down)

