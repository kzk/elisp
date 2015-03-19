;;;_ + auto-complete-mode
(setq load-path (cons "~/elisp/m/auto-complete" load-path))
(autoload 'lilfes-mode "~/elisp/m/auto-complete/auto-complete")
;(require 'auto-complete)
;(global-auto-complete-mode t)

;;;_ * Auto Mode Alist Setting
(setq auto-mode-alist
      (append
       '(
	 ;;;_*Plain Text
	 ("\\.txt$"        . text-mode)
	 ("\README"        . text-mode)

	 ;;;_*Tex
	 ;;;_+ normal tex
	 ("\\.tex$"        . yatex-mode)

	 ;;;_*Programming Language
	 ;;;_+ C
	 ("\\.c$"          . c-mode)
	 ("\\.h$"          . c++-mode)
         ;;;_+ Go
	 ("\\.go$"         . go-mode)
	 ;;;_+ C++
	 ("\\.cpp$"        . c++-mode)
	 ;;;_+ CSS
	 ("\\.css$"        . css-mode)
	 ;;;_+ Elisp
	 ("\\.el$"         . emacs-lisp-mode)
	 ;;;_+ Flex
	 ("\\.l$"          . lisp-mode)
	 ;;;_+ Flex
	 ("\\.clj$"        . clojure-mode)
	 ;;;_+ Haskell
	 ("\\.[hg]s$"      . haskell-mode)
	 ("\\.hi$"         . haskell-mode)
	 ("\\.l[hg]s$"     . literate-haskell-mode)
 	 ;;;_+ HTML
	 ("\\.htm$"        . sgml-mode)
	 ("\\.html?$"      . sgml-mode)
	 ("\\.shtml$"      . sgml-mode)
	 ("\\.erb$"        . sgml-mode)
	 ;;;_+ Java
	 ("\\.java$"       . java-mode)
	 ;;;_+ LiLFeS
	 ("\\.lil$"        . lilfes-mode)
	 ;;;_+ Makefile
	 ("\\Makefile$"    . makefile-mode)
	 ("\\Makefile.am$" . makefile-mode)
	 ;;;_+ Ocaml
	 ("\\.ml[iylp]?$"  . tuareg-mode)
	 ;;;_+ PHP
	 ("\\.php$"        . php-mode)
	 ;;;_+ Po
	 ("\\.po$"         . po-mode)
	 ;;;_+ Python
         ("\\.py$"         . python-mode)
	 ;;;_+ Ruby
	 ("\\.rb$"         . ruby-mode)
         ;;;_+ Yacc or Others
         ("\\.y$"          . text-mode)
	 ) auto-mode-alist))

;;;_ + bibtex-mode(http://www.ida.ing.tu-bs.de/people/dirk/bibtex/index.html)
;; (autoload 'bibtex-mode "~/elisp/m/bibtex-mode/bibtex")

;;;_ + cc-mode
;; (setq load-path (cons "~/elisp/m/cc-mode" load-path))
;; (add-hook 'c-mode-common-hook
;;           '(lambda ()
;;              ;;
;; 	     (setq indent-tabs-mode t)
;; 	     (setq fill-column 79)
;; 	     (setq c-basic-offset 4)
;; 	     (setq substatement-open 0)
;; 	     (setq c-backslash-column 77)
;; 	     ;;
;; 	     (gtags-mode 1)
;; 	     (gtags-make-complete-list)))

(defun my-c-mode-hook ()
  (setq indent-tabs-mode nil)
  (c-set-style "gnu"))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(add-hook 'c++-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)
             (c-set-offset 'innamespace 0)
             )) 

;(setq load-path (cons "~/elisp/misc/" load-path))
;(autoload 'java-mode-indent-annotations "~/elisp/misc/java-mode-indent-annotations")
;(require 'java-mode-indent-annotations)
;(setq java-mode-hook
;    (function (lambda()
;       (java-mode-indent-annotations-setup))))

(defun my-java-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2))
(add-hook 'java-mode-hook 'my-java-mode-hook)

;;;_ + go-mode
(autoload 'go-mode "~/elisp/m/go-mode/go-mode")

;;;_ + clojure-mode
(autoload 'clojure-mode "~/elisp/m/clojure-mode/clojure-mode")

;;;_ + css-mode
(autoload 'css-mode "~/elisp/m/css-mode/css-mode")

;;;_ + diff-mode(ftp://rum.cs.yale.edu/pub/monnier/diff-mode)
(autoload 'diff-mode "~/elisp/m/diff-mode/diff-mode")

;;;_ + flex-mode
(autoload 'flex-mode "~/elisp/m/flex-mode/flex-mode")

;;;_ + global
;(autoload 'gtags-mode "~/elisp/m/global-mode/gtags")
;(setq gtags-mode-hook
;      '(lambda ()
;	 (local-set-key "\M-t" 'gtags-find-tag)
;         (local-set-key "\M-r" 'gtags-find-rtag)
;         (local-set-key "\M-s" 'gtags-find-symbol)
;         (local-set-key "\C-t" 'gtags-pop-stack)
;	 ))

;;;_ + haskell-mode
(setq load-path (cons "~/elisp/m/haskell-mode" load-path))
(autoload 'haskell-mode "~/elisp/m/haskell-mode/haskell-mode")
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)

;;;_ + kde-devel support
; (load "~/elisp/m/kde-devel/kde-devel-emacs")

;;;_ + lilfes-mode
(setq load-path (cons "~/elisp/m/lilfes-mode" load-path))
(autoload 'lilfes-mode "~/elisp/m/lilfes-mode/lilfes-mode21")

;;;_ + tuareg-mode (ocaml)
(setq load-path (cons "~/elisp/m/tuareg-mode" load-path))
(autoload 'tuareg-mode "~/elisp/m/tuareg-mode/tuareg")

;;;_ + php-mode(http://sourceforge.net/projects/php-mode/)
(autoload 'php-mode "~/elisp/m/php-mode/php-mode")

;;;_ + python-mode(http://python-mode.sourceforge.net/)
(autoload 'python-mode "~/elisp/m/python-mode/python-mode")

;;;_ + ruby-mode(http://www.ruby-lang.org/cgi-bin/cvsweb.cgi/ruby/misc/v)
(autoload 'ruby-mode "~/elisp/m/ruby-mode/ruby-mode")
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))

;;;_ + changelog memo(http://bd.tank.jp/clmemo/about.html)
;; (defun clmemo (memo-file)
;;   (interactive)
;;   (let ((add-log-current-defun-function 'ignore))
;;     (set-buffer (find-file-noselect memo-file))
;;     (add-change-log-entry
;;      nil
;;      (expand-file-name memo-file))))
;; ;normal
;; (defun nmemo()
;;   (interactive)
;;   (clmemo "~/clmemo/clmemo.txt"))
;; ;book
;; (defun bmemo()
;;   (interactive)
;;   (clmemo "~/clmemo/bookmemo.txt"))
;; ;private
;; (defun pmemo()
;;   (interactive)
;;   (clmemo "~/clmemo/private.txt"))

;; (global-set-key "\M-m" 'nmemo)
