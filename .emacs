;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :init
  (setq-default indent-tabs-mode nil
              tab-width 4)
  (evil-mode 1))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))


(use-package smex
  :ensure t
  :init
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;;(use-package helm
;;  :ensure t
;;  :init
;;  (global-set-key (kbd "M-x") 'helm-M-x)
;;  (global-set-key (kbd "C-x r b" #'helm-filtered-book-marks))
;;  (global-set-key (kbd "C-x C-f") #'helm-find-files)
;;  (helm-mode 1))

;; My personal Emacs configurations
(setenv "SHELL" "/opt/homebrew/bin/bash")
(setq explicit-shell-file-name "/opt/homebrew/bin/bash")

(set-frame-font "Iosevka 18")
(add-to-list 'initial-frame-alist '(height . 55))
(add-to-list 'initial-frame-alist '(width . 120))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(setq display-line-numbers-type 'relative)


(ido-mode 1)
(setq ido-everywhere t)
(setq ido-auto-merge-delay-time 1)
(setq org-completion-use-ido t)

(setq inhibit-splash-screen t
      inhit-startup-message t)

;; org-mode
(require 'org)
(require 'org-habit)
(require 'org-capture)
(setq org-default-notes-file "~/organizer.org")
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file "~/organizer.org")))

(global-set-key (kbd "C-c c") 'org-capture)

(setq x-select-enable-clipboard t)
(setq backup-directory-alist '(("." . "~/.emacs-saves")))

;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'control) ;; bind command key to ctrl-key
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("03e26cd42c3225e6376d7808c946f7bed6382d795618a82c8f3838cd2097a9cc" default))
 '(org-agenda-files '("~/org-mode/habits.org" "~/org-modej/jan4.org"))
 '(org-default-notes-file "~/organizer.org")
 '(package-selected-packages '(magit cargo go-mode gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
