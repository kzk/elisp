;******************************************************************************
;               Delmonta's Line Macro for Mule 2.3 (GNU Emacs 19)              
;------------------------------------------------------------------------------
;              Primary Version for VZ Editor 1.6 (c) 1995 Delmonta             
;               Enhancement for HIDEMARU Editor (c) 1997 Delmonta              
;                Transplantation into Mule 2.3 (c) 1998 Delmonta               
;                             All rights reserved.                             
;------------------------------------------------------------------------------
; 1998.01.23: �ѥ����������ؿ���dsline:describe-patterns�פ��Ǥ��ޤ�����
;******************************************************************************

;******************************************************************************
;                       "Delmonta's Line Macro" �Ȥϲ���                       
;******************************************************************************
;C ����Υץ����Ȥ��ǡ��ؿ�������
;	/*-------------- �ᥤ��롼���� -----------------*/
;�Ȥ��񤯤��ȤäƤ���ޤ���͡��Ȥ��������������ư�ǰ����Τ����ɤ�������
;�����ǡ�����򥭡�����ȯ����������ޥ�����äƤ��ޤ��ޤ�����
;���μ����ʣ�����ޤ����������ȤǤ��뤳�Ȥ򼨤������ prefix/postfix ��
;�ե�����μ���˱����Ƽ�ưŪ�ˤ����ޤ���
;
;�����󡢤��Υե�����������⡢���Υޥ��������������ΤǤ���
;
;******************************************************************************
;                                   ������ˡ                                   
;******************************************************************************
;ds-line.el ��Ŭ���ʥǥ��쥯�ȥ�˥��ԡ�����~/.emacs �˼��Τ褦�˽񤭹���Ǥ���
;�������ǥ��쥯�ȥ��Ŭ�ڤ˻��ꤹ�뤳�ȡ�
;	(autoload 'delmonta-line-macro
;		(expand-file-name "~/bin/ds-line")	;�ե�����̾
;		"Delmonta's Line Macro"			;�ؿ�����
;		t
;	)
;�Ĥ��ˡ� delmonta-line-macro ���ޥ�ɤ�Ŭ���ʥ����˳���դ��Ƥ���������
;	(global-set-key "\M-o" 'delmonta-line-macro)
;
;�����ơ�����˳����ޤ���ʸ�������Ϥ���Ʊ���Ԥ˥���������֤���
;delmonta-line-macro ���ޥ�ɤ�¹Ԥ��Ƥ��������ʤ��Υ���������ȡ�M-o�ˡ�
;
;******************************************************************************
;                  Delmonta's Line Macro �Υ������ޥ�����ˡ��                  
;******************************************************************************
;(���) ���Υ������ޥ����ϡ�ds-line.el ���ɤ߹���Ǥ���Ԥ�ɬ�פ�����ޤ���
;       .emacs �ǹԤ��������ϡ���� autoload ʸ�򼡤Τ褦�� load-library
;	ʸ���Ѥ��Ƥ���������
;		(load-library (expand-file-name "~/bin/ds-line"))
;------------------------------------------------------------------------------
;���Υѥ�������ɲä���ˤϡ��ѿ� dsline:pattern-list �����Ǥ��ɲä��ޤ���
;------------------------------------------------------------------------------
;�����Ǥϡ��Ĥ��� 3 ���Ǥ���ʤ�ꥹ�ȤǤ���
;	(1)��ʸ�򺸴󤻡����󥿥�󥰡����󤻤Τɤ�ˤ��뤫��
;	   ��ʸ���� "L","C","R" �ǻ��ꤷ�Ƥ���������
;	   �ʤ�����ʸ���ǻ��ꤹ��ȡ�prefix/postfix �ν��Ϥ���������ޤ���
;	(2)��������ʪ�������֤�ñ�̤��礭���ǻ��ꤷ�Ƥ���������
;	   �ʤ������С������Ǥ� ASCII �ʳ���ʸ���λ��Ѥ��Զ�礬����ޤ���
;	(3)����ʸ����ά��ǽ�Ǥ���
;
;�ɲä��뤿��� Emacs Lisp ��ʸ�ϼ�����򻲾Ȥ��Ƥ���������
;	(1)�ꥹ�Ȥ���Ƭ���ɲä����硣���ξ�硢�ǥե���Ȥ��Ѱդ���Ƥ���
;	   �ѥ�����Υѥ������ֹ椬�Ѳ����ޤ���
;		(setq dsline:pattern-list
;			(cons '("C" "#" "����ʸ") dsline:pattern-list)
;		)
;	(2)�ꥹ�Ȥ��������ɲä����硣��¸�ѥ�����Υѥ������ֹ��ư���ޤ���
;		(setq dsline:pattern-list (append
;			dsline:pattern-list
;			'(
;				("L" "_-~-" "����ʸ")
;				("C" "#"    "����ʸ")
;			)
;		))
;------------------------------------------------------------------------------
;�ե����륿���סʥ᥸�㡼�⡼�ɤޤ��ϥե�����̾�ˤ�prefix/postfix ���б��ط���
;�ɲä���ˤϡ����Τ褦�ˤ��ޤ���
;------------------------------------------------------------------------------
;	(��)TeX-mode �ʤ顢prefix �� "%" �ˤ���postfix �Ϥʤ��ˤ��롣
;	    ��ĥ�Ҥ� ".c" �ʤ�С�prefix�� "/*" �ˡ�postfix �� "*/" �ˤ��롣
;		(setq dsline:prefix-and-postfix-alist (append
;			'(
;				(TeX-mode . ("%"  . ""  ))
;				("\\.c$"  . ("/*" . "*/"))
;			)
;			dsline:prefix-and-postfix-alist
;		))
;------------------------------------------------------------------------------

;******************************************************************************
;                                  �ץ����                                  
;******************************************************************************
(provide 'ds-line)

(defun delmonta-line-macro (nPatternID)
	"Delmonta's Line Macro: �������äѤ��η���������ޤ�"
	(interactive "nPattern ID, or 0 for viewing all patterns: ")
(catch 'dsline:main
(let (sStyle sPadding nUnitLen nCharL nCharR)
	;sPrefix   : ��Ƭ�ˤĤ���ѥ�����
	;sPostfix  : �����ˤĤ���ѥ�����
  	;sStyle    : ����դ��ѥ������L,C,R,l,c,r �Τ����줫��
	;sPadding  : �Ԥ�����ʸ����Υѥ�����
	;nUnitLen  : sPadding��ñ��Ĺ
	;nChar[LR] : �Ԥ�ʸ���������� padding ��ʸ����

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

	(if (eolp) (progn	; ����ʤ��Ԥ��������������
		(insert sPrefix)
		(setq nCharL (-
			(frame-width)
			(string-width sPrefix)
			(string-width sPostfix)
			1	; ���� 1 �Ϲ����β��ԤΤ֤�
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
			2	; �����β��Ԥȡ���ʸ�θ�ζ���1��
		))

		(setq nCharR nCharL)	; �ǥե���Ȥ� L �Ȥ������Ȥˤ��Ƥ���
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
"Delmonta's Line Macro: ���ѥ������������ɽ�����ޤ�"
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
				; 4�ܤ�����������

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
;------------ �᥸�㡼�⡼�ɡ���ĥ�Ҥ��� prefix/postfix ����Ф� ------------
(defun dsline:get-prefix-and-postfix ()
(let (sFilename bContinue llAlist aPrefixAndPostfix)

	(if (eq nil buffer-file-name)
		(setq sFilename "")
		(setq sFilename (file-name-sans-versions buffer-file-name))
			; �ե�����̾���������� '~' �ʤɤ������ʪ
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
;                                   �ѿ����                                   
;******************************************************************************
(defvar dsline:prefix-and-postfix-alist
	'(
		;�᥸�㡼�⡼��
		(lisp-interaction-mode			. (";"     . ""    ))

		;��ĥ��
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

		;����ե�����̾�ʥɥåȥե�����ʤɡ�
		("\\.\\(login\\|logout\\|xsession\\|.+rc\\)$"
							. ("#"     . ""    ))
		("^makefile$"				. ("#"     . ""    ))
		("\\.emacs$"				. (";"     . ""    ))
	)
	"*Delmonta's Line Macro �ǻ��Ѥ��롢�ե�����̾�ޤ��ϥ᥸�㡼�⡼�ɤ� prefix/postfix �Ȥ��б�ɽ��"
)
;------------------------------------------------------------------------------
(defvar dsline:extension-ignore-case t
	"*Delmonta's Line Macro �ǥե�����̾���� prefix/postfix �����Ȥ��ˡ��ե�����̾����ʸ������ʸ���ζ��̤򤹤뤫�ɤ��������̤򤷤ʤ����ϡ�dsline:prefix-and-postfix-alist ��Υե�����̾�Ͼ�ʸ����ɽ�����Ƥ���������"
)
;------------------------------------------------------------------------------
(defvar dsline:pattern-list
	'(
		("C" "-"  "�̾���"          )
		("L" " "  "����ѡʺ��󤻡�")
		("C" " "  "����ѡ���󤻡�")
		("C" "*"  "�礭�ʶ��ڤ���"  )
		("C" "- " "����; HTML�ˤϼ����Τ����˻��Ѥ��뤳��")
	)
	"*Delmonta's Line Macro �ǻ��Ѥ��롢���Υѥ�����ꥹ�ȡ�"
)
;******************************************************************************
;                               End of ds-line.el                              
;******************************************************************************
