;******************************************************************************
;                       �����Х��������(suitable for me)                      
;******************************************************************************
;-------------------------------- ���������ư --------------------------------
;;;��
;(global-set-key "\C-f" 'forward-char)
;(global-set-key "\C-d" 'backward-char)
;;��
;(global-set-key "\C-n" 'next-line)
;(global-set-key "\C-p" 'previous-line)
;;(global-set-key "\C-u" 'beginning-of-line)
;;(global-set-key "\C-p" 'end-of-line)

;;; ���
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-?" 'delete-backward-char)
;(global-set-key [delete] 'delete-char)

;;; "\10" = [8] = "\x8" = "\C-h"    [backspace] �� BS ����
;;; "\177" = [127] = "\x7F" (=DEL)  [delete] �� DEL ����
;;; X ���ư���Ƥ������ [backspace] �� C-h �������Ƥ�
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [backspace] [8])
;      (put 'backspace 'ascii-character 8)))

;;; C-h �ϥХå����ڡ���
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-e" 'end-of-line)
;;; DEL ��ǥ꡼�ȥ����Ȥ��ƻȤ�
;(global-set-key "\x7F" 'delete-char)     
;(define-key emacs-lisp-mode-map "\x7F" nil)           ; ~/.emacs ���Խ���
;(define-key lisp-interaction-mode-map "\x7F" nil)     ; *scratch*



;;; ����
;(global-set-key "\C-j" 'newline-and-indent)

;;; splitted window(�ȼ���ĥ)
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
