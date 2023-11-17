;;; Emacs Bedrock
;;;
;;; Extra config: Researcher

;;; Usage: Append or require this file from init.el for research helps. If you
;;; write papers in LaTeX and need to manage your citations or keep track of
;;; notes, this set of packages is for you.
;;;
;;; Denote is a simpler alternative to Org-roam: instead of maintaining a
;;; database along side your files, Denote works by enforcing a particular file
;;; naming strategy. This makes it easy to link and tag notes, much in the same
;;; way that Org-roam does. It's generally advisable to not mix Org-roam and
;;; Denote in the same directory.
;;;
;;; NOTE: the packages Citar and Org-roam live on the MELPA repository; you will
;;; need to update the `package-archives' variable in init.el before before
;;; loading this; see the comment in init.el under "Package initialization".
;;;
;;; Highly recommended to enable this file with the UI enhancements in
;;; `base.el', as Citar works best with the Vertico completing-read interface.
;;; Also recommended is the `writer.el' extra config, which adds some nice features for
;;; spell-checking etc.

;;; Contents:
;;;
;;;  - Citation Management
;;;  - Authoring
;;;  - Note Taking: Org-roam
;;;  - Note Taking: Denote

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Critical variables
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; These variables must be set for Citar to work properly!

(setopt citar-bibliography '("~/refs.bib")) ; paths to your bibtex files

;;; These variables are needed for Denote
;(setopt denote-directory (expand-file-name "~/Docs/denote-notes/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Citation Management
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package citar
  :ensure t
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :custom
  ;; Allows you to customize what citar-open does
  (citar-file-open-functions '(("html" . citar-file-open-external)
                               ;; ("pdf" . citar-file-open-external)
                               (t . find-file))))

;; Optional: if you have the embark package installed, enable the ability to act
;; on citations with Citar by invoking `embark-act'.
;(use-package citar-embark
;  :after citar embark
;  :diminish ""
;  :no-require
;  :config (citar-embark-mode))

(use-package citar-org-roam
  :diminish ""
  ;; To get this to work both Citar *and* Org-roam have to have been used
  :after citar org-roam
  :no-require
  :config
  (citar-org-roam-mode)
  (setq citar-org-roam-note-title-template "${author} - ${title}\n#+filetags: ${tags}"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Authoring
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Note Taking: Org-roam
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-roam
  :ensure t
  :config
  ;; Make sure the backlinks buffer always shows up in a side window
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (window-width . 0.4)
                 (window-height . fit-window-to-buffer)))

  (org-roam-db-autosync-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Note Taking: Denote
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package denote
  :config
  ;; Accept any symbol in a .dir-locals.el file; makes it easier to use silos.
  ;; See "silos" in the manual: https://protesilaos.com/emacs/denote
  (put 'denote-file-type 'safe-local-variable-p 'symbolp)
  )
