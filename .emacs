(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(load "~/.emacs.rc/misc-rc.el")

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(setq display-line-numbers 'relative)
(set-frame-font "Iosevka 20")

(ido-mode 1)
(ido-everywhere 1)

;; magit
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)
(setq magit-auto-revert-mode nil)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'which-key)
(which-key-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

;; c-mode-hook
(c-add-style "my-style"
             '("stroutstrup"
               (indent-tabs-mode . nil)    ; use spaces rather than tabs
               (c-basic-offset . 4)        ; indent by four spaces
               (c-offset-alist . ((inline-open . 0)
                                  (brace-list-open . 0)
                                  (statement-case-open . +)))))
(defun my-c++-mode-hook ()
  (c-set-style "my-style")
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; -------------------- org-mode ------------------------
;; Must do this so the agenda knows where to look for my files
(setq org-agenda-files '("~/org"))

;; When a TODO is set to a done state, record a timestamp
(setq org-log-done 'time)

;; Follow the links
(setq org-return-follows-link  t)

;; Associate all org files with org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Make the indentation look nicer
(add-hook 'org-mode-hook 'org-indent-mode)

;; Remap the change priority keys to use the UP or DOWN key
(define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
(define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)

;; Shortcuts for storing links, viewing the agenda, and starting a capture
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; When you want to change the level of an org item, use SMR
(define-key org-mode-map (kbd "C-c C-g C-r") 'org-shiftmetaright)

;; Hide the markers so you just see bold text as BOLD-TEXT and not *BOLD-TEXT*
(setq org-hide-emphasis-markers t)

;; Wrap the lines in org mode so that things are easier to read
(add-hook 'org-mode-hook 'visual-line-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("fc48cc3bb3c90f7761adf65858921ba3aedba1b223755b5924398c666e78af8b" "03e26cd42c3225e6376d7808c946f7bed6382d795618a82c8f3838cd2097a9cc" default))
 '(frame-brackground-mode 'dark)
 '(package-selected-packages
   '(comment-tags org-super-agenda zenburn-theme multiple-cursors rainbow-mode which-key lsp-mode smex magit gruber-darker-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
