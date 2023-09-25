;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andrew Daivs"
      user-mail-address "andrew.davis@colostate.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-monokai-pro)
;;(setq doom-theme 'doom-material)
;;(setq doom-theme 'doom-oceanic-next)
;;(setq doom-theme 'doom-old-hope)
;;(setq doom-theme 'doom-sourcerer)
;;(setq doom-theme 'tsdh-dark)
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq confirm-kill-emacs nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-to-list 'load-path "~/bin/emacs-libvterm")
(require 'vterm)

;; Set swiper in place of incremental search
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x a") 'align)
(show-paren-mode)
(use-package! tex :ensure auctex)

(use-package! company-tabnine :ensure t)
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)

;; Enable c++-mode for .cu files
(setq auto-mode-alist
  (append
    '(
      ;; File name ends in `.h'.
      ("\\.h\\'" . c++-mode)
      ;; File name ends in `.cu'.
      ("\\.cu\\'" . c++-mode)
      ;; File name ends in `.ino'.
      ("\\.ino\\'" . c++-mode)
      ;; File name ends in `.yy'.
      ("\\.yy\\'" . c++-mode)
      ;; File name end in `.CHF'
      ("\\.ChF\\'" . fortran-mode)
      ;; File name end in `.m'
      ("\\.m\\'" . octave-mode)
      ;; File name ends in `.in'.
      ("\\.in\\'" . sh-mode)
    )
    auto-mode-alist))

(defconst Chombo-style
  '((c-tab-always-indent               . t)
    (c-basic-offset                    . 2)
    (c-comment-only-line               . 0)
    (continued-statement-offset        . 2)
    (c-continued-brace-offset          . 0)
    (c-brace-offset                    . 2)
    (c-brace-imaginary-offset          . 0)
    (c-argdecl-indent                  . 2)
    (c-label-offset                    . -2)
    (c++-member-init-indent            . 2)
    (c++-continued-member-init-offset  . 0)
    (c++-empty-arglist-indent          . 2)
    (c++-friend-offset                 . 0)
    )
  "Chombo Style")


;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "Chombo" Chombo-style t))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq c-default-style "Chombo")

(set-face-attribute 'default nil :height 100)

(setq warning-minimum-level :error)
