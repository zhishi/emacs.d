;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(sanityinc-solarized-light))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)



;; Toggle between light and dark

(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-solarized-light))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-solarized-dark))
  (reapply-themes))

;; To make solarized works best in xterm-256color mode we need change the iTerm2 color palette by run this command:
;; printf '\x1B]4;234;rgb:00/2b/36;235;rgb:07/36/42;240;rgb:58/6e/75;241;rgb:65/7b/83;244;rgb:83/94/96;245;rgb:93/a1/a1;254;rgb:ee/e8/d5;230;rgb:fd/f6/e3;136;rgb:b5/89/00;166;rgb:cb/4b/16;160;rgb:dc/32/2f;125;rgb:d3/36/82;61;rgb:6c/71/c4;33;rgb:26/8b/d2;37;rgb:2a/a1/98;64;rgb:85/99/00\a'
;; just put it into .bash_rc or .zshrc file.
(defun tlight ()
  "Activate a term light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-solarized-tlight))
  (reapply-themes))

(defun tdark ()
  "Activate a term dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-solarized-tdark))
  (reapply-themes))

(provide 'init-themes)
;;; init-themes.el ends here
