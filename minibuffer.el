;; a/index.htmlとb/index.htmlを開いた時にindex.html<a>,
;; index.html<b>としてくれる
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; C-x bでbuffersを選ぶ時便利
;(iswitchb-default-keybindings)
(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "選択している buffer を window に表示してみる。"
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))

;;; bufferを巡回
(defun my-select-visible (blst n)
  (let ((buf (nth n blst)))
    (cond ((= n (- (length blst) 1)) (other-buffer))
          ((not (= (aref (buffer-name buf) 0) ? )) buf)
          (t (my-select-visible blst (+ n 1))))))
(defun my-grub-buffer ()
  (interactive)
  (switch-to-buffer (my-select-visible
                     (reverse (cdr (assq 'buffer-list (frame-parameters)))) 0)))
(global-set-key [?\C-o] 'my-grub-buffer)

