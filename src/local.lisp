(defpackage :config/local
  (:use :cl :lem))

(in-package :config/local)
(lem-vi-mode:vi-mode)

;; Load main theme
;; set font
;; (lem-if:set-font-size (implementation) 30)

;; emacs like M-x
(setf lem-core::*default-prompt-gravity* :bottom-display)
(setf lem/prompt-window::*prompt-completion-window-gravity* :horizontally-above-window)
(setf lem/prompt-window::*fill-width* t)

;;;; -- formatter --
;; TIP: Use `formatter` instead of `<<` and `>>`.
(setf lem:*auto-format* t)

(define-key lem-lisp-mode/internal:*lisp-mode-keymap* "M-j" 'delete-indentation)

;;;; -- line wrap --
(setf (variable-value 'line-wrap :global) t)
(define-key lem-vi-mode:*normal-keymap* "Space l w" 'lem-core/commands/window::toggle-line-wrap)


;;;; -- buffer --
(define-key lem-vi-mode:*normal-keymap* "Space b b" 'select-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b p" 'previous-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b n" 'next-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b B" 'select-buffer-next-window)
(define-key lem-vi-mode:*normal-keymap* "Space b d" 'kill-buffer)

;;;; -- window --
(define-key lem-vi-mode:*normal-keymap* "Space s h" 'split-active-window-horizontally)
(define-key lem-vi-mode:*normal-keymap* "Space s v" 'split-active-window-vertically)

(define-key lem-vi-mode:*normal-keymap* "Space w n" 'next-window)
(define-key lem-vi-mode:*normal-keymap* "Space w p" 'previous-window)

(define-key lem-vi-mode:*normal-keymap* "Space w h" 'window-move-left)
(define-key lem-vi-mode:*normal-keymap* "Space w j" 'window-move-down)
(define-key lem-vi-mode:*normal-keymap* "Space w k" 'window-move-up)
(define-key lem-vi-mode:*normal-keymap* "Space w l" 'window-move-right)

(define-key lem-vi-mode:*normal-keymap* "Space x x" 'delete-active-window)
(define-key lem-vi-mode:*normal-keymap* "Space x o" 'delete-other-windows)

;; NOTE To set the `sbcl-source` dir, write `(sb-ext:set-sbcl-source-location "~/.roswell/src/sbcl-2.4.10/")` in `~/.roswell/init.lisp` file.
;; TIP: use `M-,` to pop definition stack, and use `M-.` vice verse.
(define-key lem-vi-mode:*normal-keymap* "g d" 'lem/language-mode::find-definitions)
(define-key lem-vi-mode:*normal-keymap* "g r" 'lem/language-mode::find-references)
(define-key lem-vi-mode:*normal-keymap* "g s" 'lem-lisp-mode/internal::lisp-search-symbol)

(define-key lem-vi-mode:*normal-keymap* "g f" 'lem-core/commands/project:project-find-file)
(define-key lem-vi-mode:*normal-keymap* "g l" 'lem/detective:detective-all)

(define-key lem-vi-mode:*normal-keymap* "g b" 'lem/language-mode::beginning-of-defun)

(define-key lem-vi-mode:*normal-keymap* "g m" 'lem-vi-mode/binds::vi-move-to-matching-item)

(define-key lem-vi-mode:*normal-keymap* "Space d k" 'describe-key)
(define-key lem-vi-mode:*normal-keymap* "Space d b" 'describe-bindings)
(define-key lem-vi-mode:*normal-keymap* "Space d m" 'list-modes)
(define-key lem-vi-mode:*normal-keymap* "Space d D" 'documentation-describe-bindings)
;; TIP: Use M-a to autodoc

;;;; -- project --
(define-key lem-vi-mode:*normal-keymap* "Space o p" 'lem-core/commands/project:project-switch)
(define-key lem-vi-mode:*normal-keymap* "Space p r" 'lem-core/commands/project:project-root-directory)

;;;; -- theme --

(define-key lem-vi-mode:*normal-keymap* "Space t t" 'load-theme)



;; TIP: Then use `M-x query-replace` in result window
;; numbers
(lem/line-numbers:toggle-line-numbers)

(lem-lisp-mode/internal::lisp-set-package "LEM")
;; Start paredit automatically in lisp files
;; thks @sasanidas
(add-hook lem:*find-file-hook*
          (lambda (buffer)
            (when (eq (buffer-major-mode buffer) 'lem-lisp-mode:lisp-mode)
              (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t))))
;; scrolloff vi mode
(setf (lem-vi-mode:option-value "scrolloff") 5)

;; js lsp


;;;; -- dashboard --
;; (in-package :lem-dashboard)
;; (set-dashboard (list (make-instance 'dashboard-splash
;;                                     :item-attribute 'document-metadata-attribute
;;                                     :splash-texts '("
;; An idiot admires complexity, a genius admires simplicity.
;;                                                             ― Terry Davis")
;;                                     :top-margin 4
;;                                     :bottom-margin 0)))

;; Cursor + highlight
(setf lem-vi-mode/core::*default-cursor-color* "#ffffff")
;(setf (lem:variable-value 'lem-core::highlight-line-color :global) "#000066")

