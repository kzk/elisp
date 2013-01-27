;;-- language-env DON'T MODIFY THIS LINE!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 日本語表示の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 日本語 info が文字化けしないように
(auto-compression-mode t)

; 日本語 grep
(if (file-exists-p "/usr/bin/jgrep")
    (setq grep-command "jgrep -n -e ")
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 漢字変換 の設定
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
;; いろいろ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Deleteキーでカーソル位置の文字が消えるようにする
(global-set-key [delete] 'delete-char)
;; C-h キーでカーソルの左の文字が消えるようにする。
;; ただし、もともと C-h はヘルプなので、
;; これを有効にすると、ヘルプを使うときには
;; M-x help や F1 を使う必要があります。
;(global-set-key "\C-h" 'backward-delete-char)
; ---- language-env end DON'T MODIFY THIS LINE!
