;;; Emacs Bedrock
;;;
;;; Extra config: Researcher

;;; Usage: Append or require this file from init.el for research
;;; helps. If you write papers in LaTeX and need to manage your
;;; citations or keep track of notes, this set of packages is for you.
;;;
;;; Denote is a note taking package that facilitates a Zettelkasten
;;; method. Denote works by enforcing a particular file naming
;;; strategy. This makes it easy to link and tag notes.
;;;
;;; NOTE: the Citar package lives on the MELPA repository; you will
;;; need to update the `package-archives' variable in init.el before
;;; before loading this; see the comment in init.el under "Package
;;; initialization".
;;;
;;; Highly recommended to enable this file with the UI enhancements in
;;; `base.el', as Citar works best with the Vertico completing-read
;;; interface. Also recommended is the `writer.el' extra config, which
;;; adds some nice features for spell-checking etc.

;;; Contents:
;;;
;;;  - Citation Management
;;;  - Note Taking: Denote

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Critical variables
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; These variables must be set for Citar to work properly!

(setopt citar-bibliography '("~/refs.bib")) ; paths to your bibtex files

;;; These variables are needed for Denote
(setopt denote-directory (expand-file-name "~/Documents/notes/"))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Note Taking: Denote
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Denote is a simple but powerful note-taking system that relies on a
;; file-naming schema to make searching and finding notes easily. The
;; Denote package provides commands that make the note taking scheme
;; easy to follow. See the manual at:
;;
;;     https://protesilaos.com/emacs/denote
;;
(use-package denote
  :config
  (denote-rename-buffer-mode)
  (require 'denote-journal-extras))

;; Integrate citar and Denote: take notes on bibliographic entries
;; through Denote
(use-package citar-denote
  :after (:any citar denote)
  :custom
  (citar-denote-file-type 'org)
  (citar-denote-keyword "bib")
  (citar-denote-signature nil)
  (citar-denote-subdir "")
  (citar-denote-template nil)
  (citar-denote-title-format "title")
  (citar-denote-title-format-andstr "and")
  (citar-denote-title-format-authors 1)
  (citar-denote-use-bib-keywords t)
  :init
  (citar-denote-mode))
