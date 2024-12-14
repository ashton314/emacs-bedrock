;;; Emacs Bedrock
;;;
;;; Extra config: Writer

;;; Usage: Append or require this file from init.el for writing aids.
;;;
;;; Jinx is a spell-checking package that is performant and flexible.
;;; You can use Jinx inside of programming modes and it will only
;;; check spelling inside of strings and comments. (Configurable, of
;;; course.) It also supports having multiple languages (e.g. English
;;; and German) in the same file.
;;;
;;; Olivetti narrows the window margins so that your text is centered.
;;; This makes writing in a wide, dedicated window more pleasant.
;;;
;;; NOTE: the Olivetti package lives on the MELPA repository; you will
;;; need to update the `package-archives' variable in init.el before
;;; before loading this file; see the comment in init.el under
;;; "Package initialization".

;;; Contents:
;;;
;;;  - Spell checking
;;;  - Dictionary
;;;  - Distraction mitigation

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Spell checking
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Jinx: Enchanted spell-checking
(use-package jinx
  :ensure t
  :hook (((text-mode prog-mode) . jinx-mode))
  :bind (("C-;" . jinx-correct))
  :custom
  (jinx-camel-modes '(prog-mode))
  (jinx-delay 0.01))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Dictionary
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setopt dictionary-use-single-buffer t)
(setopt dictionary-server "dict.org")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Distraction mitigation
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Olivetti: Set the window margins so your text is centered
(use-package olivetti
  :ensure t
  ;; Uncomment below to make olivetti-mode turn on automatically in certain modes
  ; :hook ((markdown-mode . olivetti-mode))
  )
