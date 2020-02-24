(setq user-full-name "Hans Pistor"
      user-mail-address "hpistor@stetson.edu")


(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

(setq inhibit-startup-screen t)

(setq frame-title-format '((:eval (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name))
                    "%b"))))

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))

(use-package smart-mode-line-powerline-theme :ensure t)
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'powerline)
  (add-hook 'after-init-hook 'sml/setup))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

;; auto reload file if edited outside of emacs
(global-auto-revert-mode t)

(setq-default tab-width 4
          indent-tabs-mode nil)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(add-hook 'before-save-hook 'whitespace-cleanup)

(use-package diminish :ensure t)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package magit
  :bind (("C-M-g" . magit-status)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind
  (("C-c p f" . counsel-projectile-find-file)
   ("C-c p p" . counsel-projectile-switch-project)
   ("C-c p s" . projectile-save-project-buffers))
  :config
  (projectile-mode +1))

(global-set-key (kbd "M-p") 'ace-window)

(defun hpistor/switch-to-previous-buffer ()
  "Switch to the previous open buffer"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(key-chord-define-global "JJ" #'hpistor/switch-to-previous-buffer)
(key-chord-mode +1)



(add-hook 'rust-mode-hook
      (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)


(setq rust-format-on-save t)

(setq evil-want-C-u-scroll t)
(evil-mode 1)
(evil-escape-mode)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(ivy-mode 1)

(global-set-key (kbd "C-s") 'swiper)


(global-set-key (kbd "C-c I") #'hpistor/find-init-file)
(defun hpistor/find-init-file()
  "Edit the user's init file"
  (interactive)
  (find-file user-init-file))

(require 'evil)
(require 'evil-magit)
(require 'rust-mode)

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
    (evil-magit magit key-chord flycheck-rust ace-window counsel-projectile smartparens smart-mode-line-powerline-theme doom-themes use-package projectile counsel swiper ivy cargo eglot rust-mode evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
