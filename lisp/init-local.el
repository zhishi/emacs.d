;;----------------------------------------------------------------------------
;; set font faces
;;----------------------------------------------------------------------------
;; (if window-system
;;     (progn
;;       (set-face-background 'default "#2A2B2A")
;;       (set-face-foreground 'default "#E0E2E0")
;;       (set-face-background 'region "#404645")
;;       (set-face-foreground 'font-lock-comment-face "#70767B")
;;       (set-cursor-color "lightgrey")
;;       (setq font-lock-maximum-decoration 3)))


;;use my color theme
                                        ;(setq custom-enabled-themes nil)
                                        ;(autoload 'color-theme-molokais "color-theme-molokais" "my color theme" nil)
                                        ;(color-theme-molokais)
                                        ;(require-package 'zenburn-theme)
                                        ;(load-theme 'zenburn t)
                                        ;(require-package 'color-theme)
                                        ;(require-package 'color-theme-solarized)
                                        ;(require 'color-theme)
                                        ;(setq solarized-italic nil)
                                        ;(setq solarized-contrast 'high)
                                        ;(color-theme-solarized-light)
                                        ;(global-set-key (kbd "M-<f11>") 'color-theme-solarized-light)
                                        ;(global-set-key (kbd "M-<f12>") 'color-theme-solarized-dark)

;;----------------------------------------------------------------------------
;; set font and language
;;----------------------------------------------------------------------------
                                        ;(set-language-environment 'Chinese-GB18030)
                                        ;(setq text-scale-mode-step 1.0)
;; wrong font may cause slow
                                        ;(set-frame-font "Consolas-11")
                                        ;(add-to-list 'default-frame-alist '(font . "Consolas-11"))
                                        ;(set-frame-font "Consolas:pixelsize=16")
                                        ;(set-frame-font "Microsoft YaHei")
                                        ;(set-fontset-font "fontset-default" 'han '("Microsoft YaHei" . "unicode-bmp"))
                                        ;(set-fontset-font "fontset-default" 'han "-*-NSimSun-*-*-*-*-16-*-*-*-*-*-unicode-bmp")
                                        ;(set-fontset-font "fontset-default" 'chinese-big5-1 "-*-Microsoft YaHei-*-*-*-*-16-*-*-*-*-*-unicode-bmp")
                                        ;(set-fontset-font "fontset-default" 'chinese-big5-2 "-*-Microsoft YaHei-*-*-*-*-16-*-*-*-*-*-unicode-bmp")
                                        ;(set-fontset-font "fontset-startup" 'han '("Microsoft yahei" . "unicode-bmp"))
                                        ;(set-fontset-font "fontset-standard" 'han '("Microsoft YaHei" . "unicode-bmp"))
                                        ;(set-fontset-font "fontset-default" 'chinese-big5-1 '("Microsoft YaHei" . "unicode-bmp"))
                                        ;(set-fontset-font "fontset-default" 'chinese-big5-2 '("Microsoft YaHei" . "unicode-bmp"))

(set-face-attribute 'default nil :font "Monaco 14")
(set-frame-font "Monaco 14" nil t)

;;----------------------------------------------------------------------------
;; override some settings in the remote branch
;;----------------------------------------------------------------------------
(setq frame-title-format "%b")
(menu-bar-mode 0)
(setq-default line-spacing 0)
(setq tab-width 4)
;;(global-undo-tree-mode -1)
(global-auto-revert-mode -1)
(setq-default ac-auto-start 4)
(setq-default ac-candidate-limit 16)
(setq blink-cursor-delay 0.5)
(setq uniquify-separator nil)
(setq whitespace-cleanup-mode-only-if-initially-clean t)
(setq split-height-threshold 1000)
(setq line-number-display-limit-width 2000000)
;;(dimmer-mode 0)
(pixel-scroll-mode -1)

(remove-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(remove-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(require-package 'multi-term)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)
            (toggle-truncate-lines 1)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "M-y") 'term-paste)))

(defun toggle-window-dedicated ()
  "Control whether or not Emacs is allowed to display another
buffer in current window."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window))))
       "%s: Can't touch this!"
     "%s is up for grabs.")
   (current-buffer)))

(global-set-key (kbd "C-c t") 'toggle-window-dedicated)

(require-package 'golden-ratio-scroll-screen)
(global-set-key "\C-v" 'golden-ratio-scroll-screen-up)
(global-set-key "\M-v" 'golden-ratio-scroll-screen-down)

;; use my hippie-expand list
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-line
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        ggtags-try-complete-tag
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        ))
;; modify the standard syntax table to handle hippie-expand on right boundary
(modify-syntax-entry ?/ "." (standard-syntax-table))
(modify-syntax-entry ?| "." (standard-syntax-table))

(global-set-key "\M-\\" 'hippie-expand)

;;----------------------------------------------------------------------------
;; set ibuffer list
;;----------------------------------------------------------------------------
                                        ;(defalias 'list-buffers 'ibuffer)
                                        ;(setq ibuffer-expert t)
                                        ;(setq ibuffer-filter-group-name-face 'bold)
                                        ;(setq ibuffer-formats
                                        ;      '((mark modified read-only " "
                                        ;              (name 30 30 :left :elide) " "
                                        ;              (size 9 -1 :right) " "
                                        ;              (mode 16 16 :left :elide) " " filename-and-process)
                                        ;        (mark " " (name 16 -1) " " filename)))

                                        ;(setq ibuffer-default-sorting-mode 'alphabetic)
                                        ;(setq ibuffer-saved-filter-groups
                                        ;      (quote (("default"
                                        ;               ("xml" (mode . nxml-mode))
                                        ;               ("c++" (mode . c++-mode))
                                        ;               ("csharp" (or
                                        ;                          (mode . csharp-mode)
                                        ;                          (name . "^.+\\.cs$")))
                                        ;               ("dired" (mode . dired-mode))
                                        ;               ("perl" (mode . cperl-mode))
                                        ;               ;;("emacs" (or
;;          (name . "^\\*[^*]+\\*$")))
                                        ;               ))))
;; remove the old hook
                                        ;(remove-hook 'ibuffer-hook (car (last ibuffer-hook)))
                                        ;(add-hook 'ibuffer-hook
                                        ;          (lambda ()
                                        ;            (ibuffer-switch-to-saved-filter-groups "default")))

;;----------------------------------------------------------------------------
;; set backups and auto-save path
;;----------------------------------------------------------------------------
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
;(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq delete-old-versions t)
(setq auto-save-file-name-transforms (quote ((".*" "~/.emacs_autosaves/" t))))
(setq auto-save-list-file-prefix "~/.emacs_autosaves/")

;;----------------------------------------------------------------------------
;; set custom key bindings
;;----------------------------------------------------------------------------
(global-set-key "\C-z" 'set-mark-command)
;;(global-set-key "\C-\\" 'undo-tree-redo)

;; To be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'whole-line-or-region-kill-region)
(global-set-key "\C-c\C-k" 'whole-line-or-region-kill-region)

(global-set-key (kbd "C-c u") 'revert-buffer)
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

;; some shortcut
(defalias 'rs 'replace-string)
(defalias 'rr 'replace-regexp)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(global-set-key "%" 'match-paren)

;; book mark
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)))

(global-set-key [(control ?\,)] 'ska-point-to-register)
(global-set-key [(control ?\')] 'ska-jump-to-register)

;; open recent file
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-string fname tocpl)))))

(global-set-key "\C-x\C-r" 'recentf-open-files-compl)

;; switch buffer
(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(global-set-key (kbd "<C-prior>") 'previous-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "<C-next>") 'next-user-buffer) ; Ctrl+PageDown

;; new buffer
(defun xah-new-empty-buffer ()
  "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (text-mode)
    (setq buffer-offer-save t)))
(global-set-key (kbd "<f5>") 'xah-new-empty-buffer)

;; for SD
(defun sd-edit-file ()
  "SD edit the current file and change the buffer read-only-mode"
  (interactive)
  (shell-command (concat "sd edit " buffer-file-name))
  (revert-buffer nil t))

(global-set-key (kbd "M-<f2>") 'sd-edit-file)
;; for build error lookup
(add-to-list 'auto-mode-alist '("\\.err$" . compilation-mode))

;;----------------------------------------------------------------------------
;; etags
;;----------------------------------------------------------------------------
                                        ;(setq tags-case-fold-search nil)

                                        ;(require-package 'etags-table)
                                        ;(setq etags-table-search-up-depth 10)

                                        ;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
                                        ;(require-package 'etags-select)
                                        ;(global-set-key "\M-." 'etags-select-find-tag)
(require-package 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;;----------------------------------------------------------------------------
;; set some major modes
;;----------------------------------------------------------------------------

;; for c and c++
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
;; ÉèÖÃimenuµÄÅÅÐò·½Ê½Îª°´Ãû³ÆÅÅÐò
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-c-mode()
;; ½«»Ø³µ´úÌæC-jµÄ¹¦ÄÜ£¬»»ÐÐµÄÍ¬Ê±¶ÔÆë
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive)
;; ÉèÖÃC³ÌÐòµÄ¶ÔÆë·ç¸ñ
  (c-set-style "k&r")
  (c-set-offset 'inline-open '0)
;; ×Ô¶¯Ä£Ê½£¬ÔÚ´ËÖÖÄ£Ê½ÏÂµ±Äã¼üÈë{Ê±£¬»á×Ô¶¯¸ù¾ÝÄãÉèÖÃµÄ¶ÔÆë·ç¸ñ¶ÔÆë
  ;(c-toggle-auto-state)
;; ´ËÄ£Ê½ÏÂ£¬µ±°´BackspaceÊ±»áÉ¾³ý×î¶àµÄ¿Õ¸ñ
  (c-toggle-hungry-state)
;; TAB¼üµÄ¿í¶ÈÉèÖÃÎª4
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
;; ÔÚ²Ëµ¥ÖÐ¼ÓÈëµ±Ç°BufferµÄº¯ÊýË÷Òý
  (imenu-add-menubar-index)
;; ÔÚ×´Ì¬ÌõÉÏÏÔÊ¾µ±Ç°¹â±êÔÚÄÄ¸öº¯ÊýÌåÄÚ²¿
;  (which-function-mode)
 )

(defun linux-cpp-mode()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map [(control c) (c)] 'compile)
  (interactive)
  (c-set-style "k&r")
  (c-set-offset 'inline-open '0)
  ;(c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
;  (which-function-mode)
  )
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.bond$" . idl-mode))

;for perl
(add-hook 'cperl-mode-hook 'linux-perl-mode)
(defun linux-perl-mode()
  (define-key cperl-mode-map [return] 'newline-and-indent)
  (define-key cperl-mode-map [(control c) (control c)] 'comment-region)
  (cperl-set-style "CPerl")
  ;; ÐÞ¸Ä¶àÐÐÀ¨ºÅÄÚµÄËõ½ø
  (setq cperl-indent-parens-as-block t)
  ;; ²»°Ñ¿Õ°×ÓÃÏÂ»®ÏßÏÔÊ¾
  ;;(setq cperl-invalid-face nil)
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 4)
  (setq cperl-tab-always-indent t)
  (setq indent-tabs-mode nil)
  )
(defalias 'perl-mode 'cperl-mode)

;for lua
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.las$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(add-hook 'lua-mode-hook  'linux-lua-mode)
(defun linux-lua-mode()
  (setq indent-tabs-mode nil)
  (setq lua-indent-level 4)
  )

;; for c#
(require-package 'csharp-mode)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist))

(add-hook 'csharp-mode-hook  'linux-csharp-mode)
(defun linux-csharp-mode()
  (turn-on-font-lock)
  (c-set-style "c#")
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
;;      (yas/minor-mode-on)
  )

;; for IDL
(add-hook 'idl-mode-hook 'linux-idl-mode)
(defun linux-idl-mode()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (require 'flymake)
  (flymake-mode 0)
  )

;; for lisp hippie-expand
(defun update-slime-hippie-expand ()
   (if (equal (car hippie-expand-try-functions-list) 'try-expand-slime)
       (setq hippie-expand-try-functions-list
             (append (cdr hippie-expand-try-functions-list)
                    (list 'try-expand-slime)))))

(add-hook 'slime-mode-hook 'update-slime-hippie-expand t)
(add-hook 'slime-repl-mode-hook 'update-slime-hippie-expand t)



;;------------------------------------------------------------------
;; for java mode
;;------------------------------------------------------------------
(setq eclim-executable "/home/zshi/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
(require-package 'eclim)
(global-eclim-mode)
;; make the junit buffer check more robust
(defun eclim-java-junit-buffer? ()
  (eclim--buffer-contains-substring "org.junit."))

(require-package 'company-emacs-eclim)
(company-emacs-eclim-setup)

;; fix the wrong path issue for company-emacs-eclim
(defun my-eclim-fix-relative-path (path)
  (replace-regexp-in-string "^.*src/" "src/" path))
(advice-add 'eclim--project-current-file :filter-return #'my-eclim-fix-relative-path)

(define-key eclim-mode-map (kbd "C-c C-f") 'eclim-problems-correct)

;; salesforce like use 2 space as indent
(add-hook 'java-mode-hook  'sf-java-mode)
(defun sf-java-mode()
  (setq c-basic-offset 2)
  )

                                        ; w3m
                                        ;(require-package 'w3m)
                                        ;(setq w3m-use-symbol t)
                                        ;(setq w3m-mule-unicode-symbol
                                        ;      '("┼" "├" "┬" "┌" "┤" "│" "┐" "" "┴" "└" "─" "" "┘" "" "" ""
                                        ;        "╫" "╟" "╥" "╓" "╢" "║" "╖" "" "╨" "╙" "─" "" "╜" "" "" ""
                                        ;        "•" "□" "☆" "○" "■" "★" "◎" "●" "△" "●" "○" "□" "●" "≪ ↑ ↓ "))

;; max window
                                        ;(run-with-idle-timer 0.5 nil 'w32-send-sys-command 61488)

(server-start)

(provide 'init-local)
