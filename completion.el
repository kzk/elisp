;; 補間時大文字小文字区別無
(setq completion-ignore-case t)

;; 補完の対象にならないファイル
(setq completion-ignored-extensions
    (append '(".pdf" ".aux" ".dvi" ".ps" ".eps" ".o")
            completion-ignored-extensions))

;;;_ + ac-mode(インテリジェント補完モード)(http://www.taiyaki.org/elisp/ac-mode/)
(load "~/elisp/completion/ac-mode/ac-mode")
(autoload 'ac-mode "ac-mode" "Minor mode for advanced completion." t nil)
;; 特定のメジャーモード以外で常に ac-mode を on
(setq ac-mode-exception '(dired-mode hex-mode))
(add-hook 'find-file-hooks 'ac-mode-without-exception)
;; 補完後にカーソルを単語末に移動
(setq ac-mode-goto-end-of-word t)

;;;_ + cpp-complt
;; headerファイルの補完
(setq load-path (cons "~/elisp/completion/cpp-complt/" load-path))
(add-hook 'c++-mode-hook
          (function (lambda ()
                      (require 'cpp-complt)
                      (define-key c++-mode-map [mouse-2]
                        'cpp-complt-include-mouse-select)
                      (define-key c++-mode-map "#"
                        'cpp-complt-instruction-completing)
                      (define-key c++-mode-map "\C-c#"
                        'cpp-complt-ifdef-region)
                      (cpp-complt-init))))
(setq cpp-complt-standard-header-path
      (list
       "/home/kzk/dev-qtimmodule/immqt/immodule-qt-x11/trunk/include/"
       "/home/kzk/kde-cvs/include"
       "/usr/local/qt-copy/include/"
       ))

;;;_ + dircolors 補完したファイル名を色付け( ftp://ftp.cis.ohio-state.edu/pub/emacs-lisp/archive/ )
(load "~/elisp/completion/dircolors/dircolors.el")
;(require 'dircolors)
