;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq use-dialog-box nil
      inhibit-startup-message t
      visible-bell t)

(global-display-line-numbers-mode 1)
(column-number-mode 1)

;; Package management
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Packages
(use-package jetbrains-darcula-theme
  :config
  (load-theme 'jetbrains-darcula t))

(use-package evil
  :config
  (evil-mode 1)
  ;; Remove C-p evil binding because it conflicts with projectile
  (define-key evil-normal-state-map "\C-p" nil))

(use-package rust-mode)

(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-p") 'projectile-command-map))

(use-package which-key
  :config
  (which-key-mode 1))

(setq scroll-margin 8
      scroll-conservatively 101)

(setq frame-resize-pixelwise t)
(setq echo-keystrokes 0.02)

;; Try to keep the cursor out of the read-only portions of the minibuffer.
(setq minibuffer-prompt-properties '(read-only t intangible t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Explicitly define a width to reduce the cost of on-the-fly computation
(setq-default display-line-numbers-width 3)

;; Show absolute line numbers for narrowed regions to make it easier to tell the
;; buffer is narrowed, and where you are, exactly.
(setq-default display-line-numbers-widen t)

(setq-default display-line-numbers-type 'relative)

;; Indentation
(setq indent-tabs-mode nil ;; insert spaces
      tab-width 4)         ;; 4 spaces

;; compilation
(setq compilation-scroll-output t)

;; cc mode
(defun my-c++-mode-hook ()
  (c-set-style "stroustrup"))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; Backups
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs-backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2)

;; No line wrapping
(setq-default truncate-lines t)

;; Be nice
(setq require-final-newline t)

;; Enable Global modes
(ido-mode 1)

;; Some shit emacs added automatically, I don`t know what this is,
;; I just won't touch it
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
