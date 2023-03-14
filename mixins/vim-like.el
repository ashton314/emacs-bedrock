;;; Emacs Bedrock
;;;
;;; Mixin: Vim emulation

;;; Usage: Append or require this file from init.el for bindings in Emacs.

;;; Contents:
;;;
;;;  - Core Packages
;;;  - Evil Enhancements

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Core Packages
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil: vi emulation
(use-package evil
  :ensure t
  :init
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-keybinding nil)       ; prep to load evil-collection
  :config
  (evil-mode)

  ;; Configuring initial major mode for some modes
  (evil-set-initial-state 'vterm-mode 'emacs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Evil Enhancements
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil-collection: handy evil bindings for lots of different modes
(use-package evil-collection
  :ensure t
  :after evil
  :config
  ;; Other good ones to enable: magit, mu4e, eglot, etc.
  (evil-collection-init '(dired info))

  ;; You can add evil-mode keybindings here; for example, when we're in
  ;; special-mode, it usually means we're in some kind of uneditable buffer like
  ;; a message popup etc. `q' will quit inside these windows instead of starting
  ;; a macro recording.
  (evil-collection-define-key 'normal 'special-mode-map
    (kbd "q") 'quit-window))

;; Evil-owl: preview what's in your vim registers
(use-package evil-owl
  :ensure t
  :config
  (setq evil-owl-idle-delay 0.3)
  (setq evil-owl-max-string-length 500)
  (add-to-list 'display-buffer-alist
               '("*evil-owl*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (window-height . 30)))
  (evil-owl-mode))
