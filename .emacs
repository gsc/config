;; Lose the UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(global-font-lock-mode 1)

(if window-system
    (progn
      ;; Colores de la barra de Informacion
      (set-face-background 'mode-line "steel blue")
      (set-face-foreground 'mode-line "black")

;; Muesta el nombre del archivo en la barra de titulo
(setq frame-title-format "emacs - %f")))

;; Colores de fondo, fuente, tamaño...
(setq default-frame-alist
      '((vertical-scroll-bars . right)
	(mouse-color . "magenta")
	(cursor-color . "magenta")
	(foreground-color . "pale green")
	(background-color . "black")
))

;; mouse wheel scroll

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "smtp.gmail.com")
;;(setq smtpmail-debug-info t) ;Buscar errores
(setq smtpmail-debug-info nil) ;Si todo va OK.
(setq smtpmail-auth-credentials  ;
      (expand-file-name "~/.authinfo"))
(setq smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil)))
(setq smtpmail-smtp-service 587)

;; cargar automáticamente modo php
(add-to-list 'auto-mode-alist
   '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist
   '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist
   '("\\.tpl\\'" . php-mode))

;;inhibe mensaje inicial de emacs
(setq inhibit-startup-message t)

;; para copiar en clipboard al hacer c-w
(custom-set-variables '(x-select-enable-clipboard t))

;; Asocia octave-mode a archivos *.m (matlab).
(add-to-list
 'auto-mode-alist
 '("\\.m$" . octave-mode))

;; To use abbrev-mode, add lines like this:
;; (add-hook 'php-mode-hook
;; '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))
;; (defun clean-php-mode ()
;; (interactive)
;; (php-mode)
;; (setq c-basic-offset 2) ; 2 tabs indenting
;; (setq indent-tabs-mode nil)
;; (setq fill-column 78)
;; (c-set-offset 'case-label '+)
;; (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
;; (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
;; (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; By default, emacs uses spaces instead of tabs.
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

(add-hook 'php-mode-hook 'my-php-mode-hook)
(defun my-php-mode-hook ()
  (setq indent-tabs-mode nil)
  (let ((my-tab-width 4))
    (setq tab-width 4)
    (setq c-basic-indent 4)
    (setq c-basic-offset 4)
;;     (set (make-local-variable 'tab-stop-list)
;;          (number-sequence my-tab-width 200 my-tab-width))))
))


;; (global-set-key (kbd "TAB") 'self-insert-command)

(add-hook 'python-mode-hook 'turn-on-auto-fill)
(add-hook 'python-mode-hook
  '(lambda() (set-fill-column 80))
  (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

(load-file "~/.emacs.d/web-mode.el")
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(load-file "~/.emacs.d/vendor/dockerfile-mode.el")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(setq show-trailing-whitespace t)


;; set home as the default directory
(setq default-directory "/home/gsc")

(add-hook 'before-save-hook #'gofmt-before-save)

(add-to-list 'load-path "/home/gsc/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/gsc/.emacs.d/ac-dict")
(ac-config-default)

(require 'go-autocomplete)
(require 'auto-complete-config)

(setq gofmt-command "/home/gsc/go/bin/goimports")
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)
