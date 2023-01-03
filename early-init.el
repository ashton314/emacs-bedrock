;;; Basic settings for speed and convenience
(setq gc-cons-threshold 100000000)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq x-underline-at-descent-line nil)
(setq line-number-mode t)
(setq column-number-mode t)
(setq display-time-default-load-average nil)
(setq inhibit-startup-screen t)
(setq frame-resize-pixelwise t)
(setq initial-major-mode 'fundamental-mode)
(setq auto-revert-interval 3)
(setq auto-revert-check-vc-info t)
(setq switch-to-buffer-obey-display-actions t)

(setq-default show-trailing-whitespace nil)
(setq-default indicate-buffer-boundaries 'left)

;; We won't set these, but they're good to know about
;;
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

;; Enable horizontal scrolling
(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-flip-direction t)

;; Minibuffer/completion
;; https://www.masteringemacs.org/article/understanding-minibuffer-completion
(setq enable-recursive-minibuffers t)
(setq completion-cycle-threshold 1)
(setq completions-detailed t)
(setq tab-always-indent 'complete)
(define-key minibuffer-mode-map (kbd "TAB") 'minibuffer-complete)

;;; Enable/disable various modes
(blink-cursor-mode -1)
(tool-bar-mode -1)
(savehist-mode)
(global-auto-revert-mode)
(pixel-scroll-precision-mode)
(global-hl-line-mode)

;; Silence stupid startup message
(setq inhibit-startup-echo-area-message (user-login-name))

;;; tab-bar config: always show, put time in tab-bar
(setq tab-bar-show 0)                   ; Always show tab bar
(add-to-list 'tab-bar-format 'tab-bar-format-align-right 'append)
(add-to-list 'tab-bar-format 'tab-bar-format-global 'append)
(setq display-time-format "%a %F %T")
(setq display-time-interval 1)
(display-time-mode)

;;; Default frame configuration: full screen, good-looking title bar on macOS
(setq default-frame-alist '((fullscreen . maximized)
                            (vertical-scroll-bars . nil)
                            (horizontal-scroll-bars . nil)
                            (ns-appearance . dark)
                            (ns-transparent-titlebar . t)
                            (alpha-background . 50)))

;;; Theme
(load-theme 'modus-vivendi)
;; Use this if you like light mode
;(load-theme 'modus-operandi)

;;; Completion
(fido-vertical-mode)
(setq completion-styles '(basic initials substring))

;;; Line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;; Help buffer
(add-hook 'after-init-hook 'help-quick)
