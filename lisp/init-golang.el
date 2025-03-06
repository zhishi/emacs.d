;;; init-golang.el --- Support for the Go language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'go-mode)
(maybe-require-package 'go-guru)
(maybe-require-package 'protobuf-mode)

(defun my-go-mode-hook ()
  (setq compilation-ask-about-save nil)
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v"))
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-golang)
;;; init-golang.el ends here
