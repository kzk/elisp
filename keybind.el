;******************************************************************************
;                       キーバインド設定(suitable for me)                      
;******************************************************************************
;-------------------------------- カーソル移動 --------------------------------
;;;列
;(global-set-key "\C-f" 'forward-char)
;(global-set-key "\C-d" 'backward-char)
;;行
;(global-set-key "\C-n" 'next-line)
;(global-set-key "\C-p" 'previous-line)
;;(global-set-key "\C-u" 'beginning-of-line)
;;(global-set-key "\C-p" 'end-of-line)

;;; 削除
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-?" 'delete-backward-char)
;(global-set-key [delete] 'delete-char)

;;; "\10" = [8] = "\x8" = "\C-h"    [backspace] は BS キー
;;; "\177" = [127] = "\x7F" (=DEL)  [delete] は DEL キー
;;; X 上で動いている場合に [backspace] に C-h を割り当てる
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [backspace] [8])
;      (put 'backspace 'ascii-character 8)))

;;; C-h はバックスペース
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-e" 'end-of-line)
;;; DEL をデリートキーとして使う
;(global-set-key "\x7F" 'delete-char)     
;(define-key emacs-lisp-mode-map "\x7F" nil)           ; ~/.emacs の編集中
;(define-key lisp-interaction-mode-map "\x7F" nil)     ; *scratch*



;;; 改行
;(global-set-key "\C-j" 'newline-and-indent)

;;; splitted window(独自拡張)
;(global-set-key "\C-u" 'other-window)
;(global-set-key "\C-x C-u" 'other-window)


;------------------------------- Copy and Paste -------------------------------
;(global-set-key "\C-y" 'yank)

;------------------------------- Completion -----------------------------------
;(global-set-key "\C-n" 'ac-complete )

(define-key function-key-map [27 91 99] [S-right])
(define-key function-key-map [27 91 100] [S-left])

;------------------------------- Dynamic Macro --------------------------------
(defconst *dmacro-key* "\C-t")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)
(load "~/elisp/misc/dmacro")
