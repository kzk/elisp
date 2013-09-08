;;;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-
;;;
;----------------------------------- basic Japanese environment ----------------------------------
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;----------------------------------------- load el files -----------------------------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)

(load "~/elisp/japanese-env")
(load "~/elisp/x-window-system")
(load "~/elisp/fonts")
(load "~/elisp/line")
(load "~/elisp/mode")
(load "~/elisp/completion")
(load "~/elisp/warning")
(load "~/elisp/lookup")
(load "~/elisp/minibuffer")
(load "~/elisp/search")
(load "~/elisp/file")
(load "~/elisp/keybind")

;(load "~/elisp/auto-save-buffers")
;(require 'auto-save-buffers)
;(run-with-idle-timer 0.5 t 'auto-save-buffers) 

;; garbage collection not often occurs
(setq gc-cons-threshold 1000000)

;; Don't Display Startup Message
(setq inhibit-startup-message t)

;; cursor の blink を止める
(blink-cursor-mode 0)

;; 画面から出たとき一行だけスクロールさせる
(setq scroll-conservatively 1)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; shebangのついたファイルは自動的にchmod +x
(add-hook 'after-save-hook 'my-chmod-script)
(defun my-chmod-script() (interactive) (save-restriction (widen)
 (let ((name (buffer-file-name)))
  (if (and (not (string-match ":" name))
           (not (string-match "/\\.[^/]+$" name))
           (equal "#!" (buffer-substring 1 (min 3 (point-max)))))
     (progn (set-file-modes name (logior (file-modes name) 73))
            (message "Wrote %s (chmod +x)" name)
    ))
)))

;; 移動量
(setq scroll-step 1)

;; Wheel Mouse
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OPTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs.el を終了時にバイトコンパイルする
;(add-hook 'kill-emacs-hook
;    (lambda ()
;    (if (file-newer-than-file-p "~/.emacs")
;    (progn
;    (require 'bytecomp)
;    (displaying-byte-compile-warnings
;    (unless (byte-compile-file "~/.emacs")
;(signal nil nil)))))))

(defun contest-template ()
  (interactive)
  (insert
   "#include <iostream>\n"
   "#include <string>\n"
   "#include <vector>\n"
   "#include <map>\n"
   "#include <set>\n"
   "#include <algorithm>\n"
   "#include <numeric>\n"
   "#include <complex>\n"
   "#include <queue>\n"
   "#include <deque>\n"
   "\n"
   "#define REP(i, n) for(int i = 0; i < (int)(n); i++)\n"
   "#define FOR(it,c) for(__typeof((c).begin()) it = (c).begin(); it != (c).end(); ++it)\n"
   "#define ALL(v)    (v).begin(), (v).end()\n"
   "\n"
   "using namespace std;\n"
   "\nint\n"
   "main(void)\n"
   "{\n"
   "}\n"
   )
)

(defun agulbra-clean-out-spaces ()
  "Remove spaces at ends of lines"
  (interactive)
  (and (not buffer-read-only)
       (save-excursion
         (goto-char (point-min))
         (let ((count 0)
               (bmp (buffer-modified-p)))
           (while (re-search-forward "[ \t]+$" nil t)
             (setq count (1+ count))
             (replace-match "" t t))
           (set-buffer-modified-p bmp)
           (and (buffer-modified-p)
                  (basic-save-buffer))))))

(put 'upcase-region 'disabled nil)

(defun other-window-backward ()
  "Select the previous window."
  (interactive)
  (other-window -1))

(global-set-key "\C-x\C-p" 'other-window-backward)
(global-set-key "\C-x\C-n" 'other-window)
