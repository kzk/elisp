;*************************************************************************************************
;                                            Fontの設定                                           
;*************************************************************************************************

;; ばりばりに色付け
(global-font-lock-mode t)
;; just in time(for emacs 21)
(setq font-lock-support-mode 'jit-lock-mode)

;; 括弧を薄く
;; ( http://namazu.org/~satoru/misc/permstr.html#pale-parens )
(defvar paren-face 'paren-face)
(make-face 'paren-face)
(set-face-foreground 'paren-face "#88aaff")

(defvar brace-face 'brace-face)
(make-face 'brace-face)
(set-face-foreground 'brace-face "#ffaa88")

(defvar bracket-face 'bracket-face)
(make-face 'bracket-face)
(set-face-foreground 'bracket-face "#aaaa00")

(setq lisp-font-lock-keywords-2
      (append '(("(\\|)" . paren-face))
	      lisp-font-lock-keywords-2))

(setq lisp-font-lock-keywords-2
      (append '(("(\\|)" . paren-face))
	      lisp-font-lock-keywords-2))

(add-hook 'scheme-mode-hook
	  '(lambda ()
	     (setq scheme-font-lock-keywords-2
		   (append '(("(\\|)" . paren-face))
			   scheme-font-lock-keywords-2))))
;

;(load "~/elisp/mode/cc-mode/cc-langs")
;(setq c-font-lock-keywords-3
;      (append '(("(\\|)" . paren-face))
;	      '(("{\\|}" . brace-face))
;	      '(("\\[\\|\\]" . bracket-face))
;	      c-font-lock-keywords-3))

;;_全角空白文字を色づけ
;(load "~/elisp/font/jaspace.el")
;(require 'jaspace)

;; Tab文字を色付きにする
;;(defface my-face-b-1 '((t (:background "white"))) nil)
;;(defface my-face-b-2 '((t (:background "white"))) nil)
;;(defface my-face-u-1 '((t (:foreground "white" :underline t))) nil)
;;(defvar my-face-b-1 'my-face-b-1)
;;(defvar my-face-b-2 'my-face-b-2)
;;(defvar my-face-u-1 'my-face-u-1)
;;(defadvice font-lock-mode (before my-font-lock-mode ())
;;  (font-lock-add-keywords
;;   major-mode
;;   '(("\t" 0 my-face-b-2 append)
;;     ("　" 0 my-face-b-1 append)
;;     ("[ \t]+$" 0 my-face-u-1 append)
;;     )))
;;(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
;;(ad-activate 'font-lock-mode)
