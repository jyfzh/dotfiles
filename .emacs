;; 设置emacs默认路径
(setq default-directory "~/") 
;; 加载自己的配置文件
;; (load-file "~/.emacs.d/init.el")

(load-theme 'wombat t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/code/org/test.org"))
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font 14" :foundry "outline" :slant normal :weight normal :height 161 :width normal)))))

(require 'evil)
(evil-mode 1)


(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCEL")))

(setq org-todo-keywords
      '((sequence "TODO(t)"  "|" "DONE(d!)" "CANCEL(c!)")))

(setq org-agenda-include-diary t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; read agend data from which file
(setq org-agenda-files (list "~/code/org/"))
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

(eval-after-load "org"
  '(require 'ox-md nil t))
