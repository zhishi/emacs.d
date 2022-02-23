;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)
(when (maybe-require-package 'orderless)
  (with-eval-after-load 'vertico
    (require 'orderless)
    (setq completion-styles '(substring orderless))

    ;; for sort files
    ;; try the `completion-category-sort-function' first
    (advice-add #'vertico--sort-function :before-until #'completion-category-sort-function)

    (defun completion-category-sort-function ()
      (alist-get (vertico--metadata-get 'category)
                 completion-category-sort-function-overrides))

    (defvar completion-category-sort-function-overrides
      '((file . directories-before-files))
      "Completion category-specific sorting function overrides.")

    (defun directories-before-files (files)
      ;; Still sort by alphabetically
      (setq files (vertico-sort-alpha files))
      ;; But then move directories first
      (nconc (seq-filter (lambda (x) (string-suffix-p "/" x)) files)
             (seq-remove (lambda (x) (string-suffix-p "/" x)) files)))))

(setq completion-category-defaults nil
      completion-category-overrides nil)
(setq completion-cycle-threshold 4)

(when (and (version< "28.1" emacs-version) (maybe-require-package 'corfu))
  (setq-default corfu-auto t)
  (with-eval-after-load 'eshell
    (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
  (setq-default corfu-quit-no-match 'separator)
  (add-hook 'after-init-hook 'global-corfu-mode)



  (with-eval-after-load 'corfu
    (corfu-popupinfo-mode))

  ;; Make Corfu also work in terminals, without disturbing usual behaviour in GUI
  (when (maybe-require-package 'corfu-terminal)
    (with-eval-after-load 'corfu
      (corfu-terminal-mode)))

  ;; TODO: https://github.com/jdtsmith/kind-icon
  )


(provide 'init-corfu)
;;; init-corfu.el ends here
