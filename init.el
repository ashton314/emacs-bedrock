;;; Basic packages to improve life

;;; Navigation

;; Avy: move around buffers with ease
(use-package avy
  :ensure t
  :bind (("C-c j" . avy-goto-line)
         ("s-j"   . avy-goto-char-timer)))

;;; Discovery

;; which-key: shows a popup of available keybindings
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;;; Utilities

;; Magit: best Git client to ever exist
(use-package magit
  :ensure t)

;;; Minibuffer and completion

;; Vertico: better vertical completion for minibuffer commands
(use-package vertico
  :ensure t
  :init
  (fido-mode -1)
  (vertico-mode))

;; Marginalia: annotations for minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Popup completion-at-point
(use-package corfu
  :ensure t
  :config
  (global-corfu-mode))

;; Part of corfu
(use-package corfu-popupinfo
  :after corfu
  :hook (corfu-mode . corfu-popupinfo-mode)
  :bind (:map corfu-map
              ("M-h" . corfu-popupinfo-toggle)
              ("M-k" . corfu-popupinfo-scroll-down)
              ("M-j" . corfu-popupinfo-scroll-up))
  :custom
  (corfu-popupinfo-delay '(0.25 . 0.1))
  (corfu-popupinfo-hide nil)
  :config
  (corfu-popupinfo-mode))

;; Make corfu popup come up in terminal overlay
(use-package corfu-terminal
  :if (not (display-graphic-p))
  :ensure t
  :config
  (corfu-terminal-mode))

;; Pretty icons for corfu
(use-package kind-icon
  :if (display-graphic-p)
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; Consult: Misc. enhanced commands
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer) ;; orig. switch-to-buffer
         ("M-y" . consult-yank-pop) ;; orig. yank-pop
         ("C-s" . consult-line)     ;; orig. isearch
         ))

;; Orderless: powerful completion style
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(corfu-terminal consult corfu orderless marginalia vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
