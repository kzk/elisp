;;-- language-env DON'T MODIFY THIS LINE!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ���ܸ�ɽ��������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ���ܸ� info ��ʸ���������ʤ��褦��
(auto-compression-mode t)

; ���ܸ� grep
(if (file-exists-p "/usr/bin/jgrep")
    (setq grep-command "jgrep -n -e ")
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �����Ѵ� ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(set-input-method 'japanese-egg-canna)
;;(global-set-key "\C-o" 'toggle-input-method)
;;(toggle-input-method nil)

;;anthy
;(push "/usr/share/emacs21/site-lisp/anthy" load-path)
;(load-library "anthy")
;(setq default-input-method "japanese-anthy")

;;sumibi
;(setq sumibi-debug t)
;(setq sumibi-server-cert-file "~/elisp/inputmethod/sumibi/CAcert.crt")
;(load "~/elisp/inputmethod/sumibi/sumibi.el")
;(global-sumibi-mode 1)

;;prime
;(setq default-input-method "japanese-prime")

;;uim
;(setq load-path (append '("~/elisp/inputmethod/uim") load-path))
;(setq uim-agent "~/elisp/inputmethod/uim/uim-el-agent")

;(require 'uim)
;(setq default-input-method "japanese-anthy-uim")
;(setq uim-candidate-display-inline t)
;(global-set-key "\C-u" 'uim-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Delete�����ǥ���������֤�ʸ�����ä���褦�ˤ���
(global-set-key [delete] 'delete-char)
;; C-h �����ǥ�������κ���ʸ�����ä���褦�ˤ��롣
;; ����������Ȥ�� C-h �ϥإ�פʤΤǡ�
;; �����ͭ���ˤ���ȡ��إ�פ�Ȥ��Ȥ��ˤ�
;; M-x help �� F1 ��Ȥ�ɬ�פ�����ޤ���
;(global-set-key "\C-h" 'backward-delete-char)
; ---- language-env end DON'T MODIFY THIS LINE!
