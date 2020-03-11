(setq gc-cons-threshold (* 1024 1024 1024))
(setq large-file-warning-threshold 100000000)

(defun hpistor/reload-emacs-config ()
  "Reload the Emacs config."
  (interactive)
  (load-file user-init-file)
  )

(global-set-key (kbd "C-c <f12>") 'hpistor/reload-emacs-config)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-list
      '(evil-magit magit key-chord flycheck-rust ace-window counsel-projectile smartparens smart-mode-line-powerline-theme doom-themes use-package projectile counsel swiper ivy cargo eglot rust-mode evil))

;; activate all packages
(package-initialize)

;; fetch list of packages available
(unless package-archive-contents (package-refresh-contents))

;; install missing packages
(dolist (package package-list) (unless (package-installed-p package) (package-install package)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))









(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(package-selected-packages
   (quote
    (yaml-mode evil-escape-mode evil-magit magit key-chord flycheck-rust ace-window counsel-projectile smartparens smart-mode-line-powerline-theme doom-themes use-package projectile counsel swiper ivy cargo eglot rust-mode evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
