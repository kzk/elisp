;; バッファの最後の行で next-line しても新しい行を作らない
(setq next-line-add-newlines nil)

;;; 最終行に必ず一行挿入する
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

;----------------- バッファの最初の行で previous-line しても、 ----------------
;-------------- "beginning-of-buffer" と注意されないようにする。 --------------
(defun previous-line (arg)
(interactive "p")
(if (interactive-p)
(condition-case nil
(line-move (- arg))
((beginning-of-buffer end-of-buffer)))
(line-move (- arg)))
nil)

;;; 行末の空白を削除する
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

