;;; init.el --- Chay-Man's Emacs init file.
;;; Commentary:
;;; code:
(show-paren-mode)
(setq x-select-enable-primary t)
(setq inhibit-startup-screen t)
(setq menu-bar-mode nil)
(setq require-final-newline t)
(setq visible-bell 'yea)
(tool-bar-mode nil)

; Package(s)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))

(package-initialize)
(run-with-idle-timer 45 nil 'package-refresh-contents)

(when (not (package-installed-p 'use-package))
    (package-install 'use-package))

(use-package evil
  :ensure t
  :config (evil-mode))

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
  :ensure t)
(global-flycheck-mode)
;;; init.el ends here
