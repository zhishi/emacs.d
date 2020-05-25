;;; init-cc.el --- Support for the CPP language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;;;;;; prepare works
;; # new ctags
;; brew install --HEAD universal-ctags/universal-ctags/universal-ctags
;; alias ctags="`brew --prefix`/bin/ctags"

;; # gtags
;; download source code
;; ./configure --with-universal-ctags=/usr/local/bin/ctags
;; make & sudo make install
;; on project folder
;; gtags --gtagslabel=new-ctags
;; and put this into start script export GTAGSLABEL=new-ctags

;; for c and c++
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
;;(require 'eglot)
;;(add-to-list 'eglot-server-programs '((c++-mode c-mode) "/usr/local/opt/llvm/bin/clangd"))
;;(add-hook 'c-mode-hook 'eglot-ensure)
;;(add-hook 'c++-mode-hook 'eglot-ensure)

(require-package 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))

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
  (setq c-basic-offset 2)
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
  (setq c-basic-offset 2)
  (imenu-add-menubar-index)
                                        ;  (which-function-mode)
  )
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(provide 'init-cc)
;;; init-golang.el ends here
