;;; personal/init.el -  Personal configuration for prelude distribution

;;; Prelude settings overloading
(setq css-indent-offset 2)

;;; Frame
(global-set-key [(control ?v)]
                (lambda () (interactive (next-line (/ (window-height (selected-window)) 4)))))
;; TODO: switch off wrap of words lobal
(setq scroll-margin 5)
(menu-bar-mode -1)

;;; Cursor
;; (blink-cursor-mode 0)
;; (blink-cursor-blinks 0)
;; (setq-default cursor-type 'bar)

;;; Linum
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;;; Dired
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2)
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

(add-hook 'dired-after-readin-hook 'sof/dired-sort)

;;; Keys
;; unbindings
(global-unset-key (kbd "C-z"))

;; moving
(global-set-key (kbd "M-p") 'forward-word)
(global-set-key (kbd "M-n") 'backward-word)

;; splitting frames
(progn
  (define-prefix-command 'split-window-key-prefix)
  (define-key split-window-key-prefix (kbd "h") 'split-window-below)
  (define-key split-window-key-prefix (kbd "v") 'split-window-right)
  (define-key split-window-key-prefix (kbd "c") 'delete-window)
  (define-key split-window-key-prefix (kbd "o") 'delete-other-windows))
(global-set-key (kbd "C-x w") split-window-key-prefix)

;; case transformation
(defun snakecase-word ()
  "TODO: Transform word to snakecase"
  (interactive)
  (message "snakecase-word"))

(defun snakecase-region ()
  "TODO:Transform region to snakecase"
  (interactive)
  (message "snakecase-region"))

(defun kebabcase-word ()
  "TODO: ransform word to kebabcase"
  (interactive)
  (message "kebabcase-word"))

(defun kebabcase-region ()
  "TODO: Transform region to kebabcase"
  (interactive)
  (message "kebabcase-region"))

(defun camelcase-word ()
  "TODO: Transform word to camelcase"
  (interactive)
  (message "camelcase-word"))

(defun camelcase-region ()
  "TODO: Transform region to camelcase"
  (interactive)
  (message "camelcase-region"))

(progn
  (define-prefix-command 'case-transformation-key-prefix)
  (define-key case-transformation-key-prefix (kbd "s") 'snakecase-word)
  (define-key case-transformation-key-prefix (kbd "c") 'camelcase-word)
  (define-key case-transformation-key-prefix (kbd "t") 'capitalize-word)
  (define-key case-transformation-key-prefix (kbd "u") 'upcase-word)
  (define-key case-transformation-key-prefix (kbd "l") 'downcase-word)
  (define-key case-transformation-key-prefix (kbd "k") 'kebabcase-word)
  (define-key case-transformation-key-prefix (kbd "S") 'snakecase-region)
  (define-key case-transformation-key-prefix (kbd "C") 'camelcase-region)
  (define-key case-transformation-key-prefix (kbd "T") 'capitalize-region)
  (define-key case-transformation-key-prefix (kbd "U") 'upcase-region)
  (define-key case-transformation-key-prefix (kbd "L") 'downcase-region)
  (define-key case-transformation-key-prefix (kbd "K") 'kebabcase-region))
(global-set-key (kbd "C-x t") case-transformation-key-prefix)

;; searching
;; TODO: Disable .idea and other folders for search
(global-set-key (kbd "C-c C-s") 'rgrep)
;; TODO: word / isearch /regexp

;; replacing
;; TODO: word / ireplace / regexp

;; selecting
;; TODO: word / line / block / function

;; transpose
;; TODO: chars / words / blocks / lines

;; check spelling
;; TODO: check and correction

;; rectangles
;; TODO: bindings need?

;; multiple-cursors.el
;; TODO: require and bindings
