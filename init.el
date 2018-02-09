;;; init.el --- Chay-Man's Emacs init file.
;;; Commentary:
;;; code:
(show-paren-mode)
(setq x-select-enable-primary t)
(setq inhibit-startup-screen t)
(setq require-final-newline t)
(setq visible-bell 'yea)
(setq font-lock-maximum-decoration t)
(column-number-mode)
(menu-bar-mode 0)
(tool-bar-mode 0)

; Package(s)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path (concat user-emacs-directory "custom.el/"))
(package-initialize)
(run-with-idle-timer 45 nil 'package-refresh-contents)

; Ensure use-package is installed (useful when starting from scratch)
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode)
  (global-set-key [C-tab] 'evil-window-next)
  (require 'evil-leader)
  (global-evil-leader-mode))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode #'rainbow-delimiters-mode)
  (add-hook 'common-lisp-mode #'rainbow-delimiters-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (setq flycheck-shellcheck-follow-sources nil))

(add-to-list 'auto-mode-alist '("\\.ks\\'" . shell-script-mode))
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd" :family "Inconsolata")))))
