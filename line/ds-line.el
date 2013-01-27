;******************************************************************************
;               Delmonta's Line Macro for Mule 2.3 (GNU Emacs 19)              
;------------------------------------------------------------------------------
;              Primary Version for VZ Editor 1.6 (c) 1995 Delmonta             
;               Enhancement for HIDEMARU Editor (c) 1997 Delmonta              
;                Transplantation into Mule 2.3 (c) 1998 Delmonta               
;                             All rights reserved.                             
;------------------------------------------------------------------------------
; 1998.01.23: パターン説明関数「dsline:describe-patterns」ができました。
;******************************************************************************

;******************************************************************************
;                       "Delmonta's Line Macro" とは何か                       
;******************************************************************************
;C 言語のプログラムとかで、関数境界に
;	/*-------------- メインルーチン -----------------*/
;とか書くことってありますよね。ところが、この線を手動で引くのがめんどくさい。
;そこで、これをキー操作一発で生成するマクロを作ってしまいました。
;線の種類は複数作れますし、コメントであることを示すための prefix/postfix も
;ファイルの種類に応じて自動的にかわります。
;
;もちろん、このファイル中の線も、このマクロで生成したものです。
;
;******************************************************************************
;                                   使用方法                                   
;******************************************************************************
;ds-line.el を適当なディレクトリにコピーし、~/.emacs に次のように書き込んでくだ
;さい。ディレクトリは適切に指定すること。
;	(autoload 'delmonta-line-macro
;		(expand-file-name "~/bin/ds-line")	;ファイル名
;		"Delmonta's Line Macro"			;関数説明
;		t
;	)
;つぎに、 delmonta-line-macro コマンドを適当なキーに割り付けてください。
;	(global-set-key "\M-o" 'delmonta-line-macro)
;
;そして、線中に割り込ませる文字を入力し、同じ行にカーソルを置いて
;delmonta-line-macro コマンドを実行してください（このキー設定だと、M-o）。
;
;******************************************************************************
;                  Delmonta's Line Macro のカスタマイズ方法。                  
;******************************************************************************
;(注意) このカスタマイズは、ds-line.el を読み込んでから行う必要があります。
;       .emacs で行いたい場合は、上の autoload 文を次のように load-library
;	文に変えてください。
;		(load-library (expand-file-name "~/bin/ds-line"))
;------------------------------------------------------------------------------
;線のパターンを追加するには、変数 dsline:pattern-list に要素を追加します。
;------------------------------------------------------------------------------
;各要素は、つぎの 3 要素からなるリストです。
;	(1)本文を左寄せ・センタリング・右寄せのどれにするか。
;	   大文字の "L","C","R" で指定してください。
;	   なお、小文字で指定すると、prefix/postfix の出力が抑制されます。
;	(2)行中の埋め物。繰り返し単位の大きさで指定してください。
;	   なお、現バージョンでは ASCII 以外の文字の使用に不具合があります。
;	(3)解説文。省略可能です。
;
;追加するための Emacs Lisp 構文は次の例を参照してください。
;	(1)リストの先頭に追加する場合。この場合、デフォルトで用意されている
;	   パターンのパターン番号が変化します。
;		(setq dsline:pattern-list
;			(cons '("C" "#" "説明文") dsline:pattern-list)
;		)
;	(2)リストの末尾に追加する場合。既存パターンのパターン番号は動きません。
;		(setq dsline:pattern-list (append
;			dsline:pattern-list
;			'(
;				("L" "_-~-" "説明文")
;				("C" "#"    "説明文")
;			)
;		))
;------------------------------------------------------------------------------
;ファイルタイプ（メジャーモードまたはファイル名）とprefix/postfix の対応関係を
;追加するには、次のようにします。
;------------------------------------------------------------------------------
;	(例)TeX-mode なら、prefix を "%" にし、postfix はなしにする。
;	    拡張子が ".c" ならば、prefixを "/*" に、postfix を "*/" にする。
;		(setq dsline:prefix-and-postfix-alist (append
;			'(
;				(TeX-mode . ("%"  . ""  ))
;				("\\.c$"  . ("/*" . "*/"))
;			)
;			dsline:prefix-and-postfix-alist
;		))
;------------------------------------------------------------------------------

;******************************************************************************
;                                  プログラム                                  
;******************************************************************************
(provide 'ds-line)

(defun delmonta-line-macro (nPatternID)
	"Delmonta's Line Macro: 行幅いっぱいの罫線を引きます"
	(interactive "nPattern ID, or 0 for viewing all patterns: ")
(catch 'dsline:main
(let (sStyle sPadding nUnitLen nCharL nCharR)
	;sPrefix   : 行頭につけるパターン
	;sPostfix  : 行末につけるパターン
  	;sStyle    : 割り付けパターン（L,C,R,l,c,r のいずれか）
	;sPadding  : 行を埋める文字列のパターン
	;nUnitLen  : sPaddingの単位長
	;nChar[LR] : 行の文字列の前後の padding の文字数

	(if (= nPatternID 0) (progn
		(dsline:describe-patterns)
		(throw 'dsline:main nil)
	))

	(setq sStyle (nth (1- nPatternID) dsline:pattern-list))
	(setq sPadding (car (cdr sStyle)))
	(setq sStyle (car sStyle))

	(if (string-equal sStyle (upcase sStyle)) 
	(progn
		(setq sPrefix (dsline:get-prefix-and-postfix))
		(setq sPostfix (cdr sPrefix))
		(setq sPrefix  (car sPrefix))
	) ; end of THEN ; ELSE follows
		(setq sPrefix  "")
		(setq sPostfix "")

		(setq sStyle (upcase sStyle))
	) ;endif

	(setq nUnitLen (string-width sPadding))

	(beginning-of-line)

	(if (eolp) (progn	; 何もない行に線だけ引く場合
		(insert sPrefix)
		(setq nCharL (-
			(frame-width)
			(string-width sPrefix)
			(string-width sPostfix)
			1	; この 1 は行末の改行のぶん
		))
		(setq nCharL (- nCharL (% nCharL nUnitLen)))

		(while (< (string-width sPadding) nCharL)
			(setq sPadding (concat sPadding sPadding)) 
		)

		(insert (substring sPadding 0 nCharL))
		(insert sPostfix)

	); end of THEN block ; ELSE block follows

		(insert sPrefix)
		(insert " ")

		(end-of-line)
		(while (> (+ (current-column)(string-width sPostfix) 1)
		          (1- (frame-width))
		       )
			(backward-char)
		)

		(if (eolp)
			nil
			(insert "\n")
			(backward-char)
		)

		(setq nCharL (-
			(frame-width)
			(current-column)
			(string-width sPostfix)
			2	; 行末の改行と、本文の後の空白1つ
		))

		(setq nCharR nCharL)	; デフォルトは L ということにしておく
		(if (string-equal sStyle "C") (setq nCharR (/ nCharL 2)))
		(if (string-equal sStyle "R") (setq nCharR 0))

		(setq nCharR (- nCharR (% nCharR nUnitLen)))
		(setq nCharL (- nCharL nCharR))
		(setq nCharL (- nCharL (% nCharL nUnitLen)))

		(move-to-column (string-width sPrefix))
		(while (< (string-width sPadding) nCharL)
			(setq sPadding (concat sPadding sPadding))
		)
		(insert (substring sPadding 0 nCharL))

		(end-of-line)
		(insert " ")
		(while (< (string-width sPadding) nCharR)
			(setq sPadding (concat sPadding sPadding))
		)
		(insert (substring sPadding 0 nCharR))
		(insert sPostfix)
	); endif

	(if (eobp)
		(insert "\n")
		(forward-char)
	)
)))
;------------------------------------------------------------------------------
(defun dsline:describe-patterns () (interactive)
"Delmonta's Line Macro: 全パターンの説明を表示します"
(let (nPatternID llPatternList lPattern sPudding sStyle sDocumentation)
	(save-excursion (with-output-to-temp-buffer "*Help*"
		(set-buffer standard-output)
		(insert "Line Patterns are:\n\n")
		(insert "ID    Pattern\n\n")

		(setq llPatternList dsline:pattern-list)
		(setq nPatternID 0)
		(while llPatternList
			(setq nPatternID (1+ nPatternID))
			(setq lPattern (car llPatternList))
			(setq llPatternList (cdr llPatternList))

			(setq sPudding (nth 1 lPattern))

			(setq sPudding (concat sPudding sPudding))
			(setq sPudding (concat sPudding sPudding))
				; 4倍に増殖させる

			(setq sStyle (car lPattern))
			(insert (substring (format "%d     " nPatternID) 0 6))

			(if (string-equal sStyle (upcase sStyle))
			(progn
				(insert "/*")
				(save-excursion (insert "*/"))
			))
			(setq sStyle (upcase sStyle))
			(setq sDocumentation (nth 2 lPattern))
			(if (not sDocumentation)
				(setq sDocumentation
					(format "Pattern #%d" nPatternID)
				)
			)

			(if (string-equal sStyle "C")
			(insert
				sPudding " " sDocumentation " " sPudding
			))
			(if (string-equal sStyle "L")
			(insert
				" " sDocumentation " " sPudding sPudding
			))
			(if (string-equal sStyle "R")
			(insert
				sPudding sPudding " " sDocumentation " "
			))

			(end-of-line)
			(insert "\n")
		)
		(print-help-return-message)
	))
))
;------------ メジャーモード・拡張子から prefix/postfix を割り出す ------------
(defun dsline:get-prefix-and-postfix ()
(let (sFilename bContinue llAlist aPrefixAndPostfix)

	(if (eq nil buffer-file-name)
		(setq sFilename "")
		(setq sFilename (file-name-sans-versions buffer-file-name))
			; ファイル名から末尾の '~' などを除いた物
	)

	(if dsline:extension-ignore-case
		(setq sFilename (downcase sFilename))
	)
	
	(setq llAlist dsline:prefix-and-postfix-alist)
	(setq aPrefixAndPostfix '("" . ""))

	(setq bContinue t)
	(while (and bContinue llAlist)
		(setq lPattern (car llAlist))
		(if (stringp (car lPattern))
			(if (string-match (car lPattern) sFilename)
				(progn
					(setq aPrefixAndPostfix (cdr lPattern))
					(setq bContinue nil)
				)
			)
		)

		(if (eq (car lPattern) major-mode)
			(progn
				(setq aPrefixAndPostfix (cdr lPattern))
				(setq bContinue nil)
			)
		)

		(setq llAlist (cdr llAlist))
	)
	aPrefixAndPostfix
))
;******************************************************************************
;                                   変数定義                                   
;******************************************************************************
(defvar dsline:prefix-and-postfix-alist
	'(
		;メジャーモード
		(lisp-interaction-mode			. (";"     . ""    ))

		;拡張子
		("\\.s?html?$"				. ("<!-- " . " -->"))
		("\\.\\(c\\|cpp\\|cc\\|h\\|hpp\\|hh\\)$". ("/*"    . "*/"  ))
		("\\.\\(elc?\\|asm\\|inc\\|ini\\|inc\\)$"
							. (";"     . ""    ))
		("\\.\\(\\(t?c\\)?sh\\|pl\\|cgi\\|sed\\|mak\\)$"
							. ("#"     . ""    ))
		("\\.\\([a-z]*tex\\(i\\(nfo\\)?\\)?\\|sty\\|cls\\|clo\\|e?ps\\)$"
							. ("%"     . ""    ))
		("\\.\\(p\\|pas\\)$"			. ("{"     . "}"   ))
		("\\.\\(bas\\|frm\\)$"			. ("'"     . ""    ))
		("\\.\\(bat\\|cws\\)$"			. ("rem "  . ""    ))

		;特定ファイル名（ドットファイルなど）
		("\\.\\(login\\|logout\\|xsession\\|.+rc\\)$"
							. ("#"     . ""    ))
		("^makefile$"				. ("#"     . ""    ))
		("\\.emacs$"				. (";"     . ""    ))
	)
	"*Delmonta's Line Macro で使用する、ファイル名またはメジャーモードと prefix/postfix との対応表。"
)
;------------------------------------------------------------------------------
(defvar dsline:extension-ignore-case t
	"*Delmonta's Line Macro でファイル名から prefix/postfix を求めるときに、ファイル名の大文字・小文字の区別をするかどうか。区別をしない場合は、dsline:prefix-and-postfix-alist 中のファイル名は小文字で表記してください。"
)
;------------------------------------------------------------------------------
(defvar dsline:pattern-list
	'(
		("C" "-"  "通常用"          )
		("L" " "  "中身用（左寄せ）")
		("C" " "  "中身用（中寄せ）")
		("C" "*"  "大きな区切り用"  )
		("C" "- " "破線; HTMLには実線のかわりに使用すること")
	)
	"*Delmonta's Line Macro で使用する、線のパターンリスト。"
)
;******************************************************************************
;                               End of ds-line.el                              
;******************************************************************************
