(global-font-lock-mode 1)

(if window-system
    (progn
      ;; Colores de la barra de Informacion
      (set-face-background 'modeline "steel blue")
      (set-face-foreground 'modeline "black")

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
