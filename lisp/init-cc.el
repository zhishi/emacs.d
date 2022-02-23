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
;; cp /usr/local/share/gtags/gtags.conf ~/.globalrc
;; and put this into start script export GTAGSLABEL=new-ctags
;; to show full file path: M-o, add customize ggtags-global-abbreviate-filename

;; put ~/.ctags.d/config.ctags with
;; --kinds-c++=+A
;; --fields=+imaftn
;; --extras=+q

(require-package 'ggtags)
;; for c and c++
(add-hook 'c-mode-hook 'linux-cpp-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "/usr/local/opt/llvm/bin/clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)
;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

;; ÉèÖÃimenuµÄÅÅÐò·½Ê½Îª°´Ãû³ÆÅÅÐò
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-cpp-mode()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map [(control c) (c)] 'compile)
  (interactive)
  (c-set-style "k&r")
  (c-set-offset 'inline-open '0)
                                        ;(c-toggle-auto-state)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)
  ;;(c-set-offset 'arglist-intro '+)
  ;; use C-c C-s to show the syntactic analysis
  (c-set-offset 'statement-cont 4)
  (c-set-offset 'arglist-intro 4)
  (c-set-offset 'member-init-intro 4)
  (c-set-offset 'innamespace 0)
  ()
  (imenu-add-menubar-index)
  (require 'flymake)
  (flymake-mode 0)
  (ggtags-mode 1)
  ;;(define-key ggtags-mode-map "\M-." nil)
  ;;(local-set-key (kbd "C-.") 'ggtags-find-tag-dwim)
  (local-set-key (kbd "C-.") 'ggtags-find-definition)
  (setq ggtags-global-abbreviate-filename 300)
  ;;(local-set-key (kbd "M-.") 'ggtags-find-definition)
                                        ;  (which-function-mode)
  )
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(provide 'init-cc)
;;; init-golang.el ends here
