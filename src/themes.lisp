;; TIP: To tweak the color, use `M-x color-preview`.

(defpackage :config/themes
  (:use :cl :lem))

(in-package :config/themes)

(lem-base16-themes::define-base16-color-theme "sakurawald"
  :base00 "#131314" ;; default background
  :base01 "#393939" ;; status bar, line numbers and folding marks
  :base02 "#515151" ;; selection
  :base03 "#777777" ;; comment
  :base04 "#b4b7b4"
  :base05 "#cccccc"
  :base06 "#ff00ff" ;; repl value
  :base07 "#ffffff" ;; line numbers
  :base08 "#ff7f7b" ;; sldb condition
  :base09 "#ffbf70" ;; sldb restart
  :base0a "#fbf305" ;; multiplexier
  :base0b "#54b33e" ;; string
  :base0c "#54fcfc" ;; keyword symbol
  :base0d "#4a4ffc" ;; function name
  :base0e "#fc54fc" ;; operator
  :base0f "#ed864a")


(lem-base16-themes::define-base16-color-theme "everforest-dark"
  :base00 "#2b3339"
  :base01 "#323c41"
  :base02 "#383f45"
  :base03 "#868d80"
  :base04 "#d3c6aa"
  :base05 "#d3c6aa"
  :base06 "#e9e8d2"
  :base07 "#fff9e8"
  :base08 "#7fbbb3"
  :base09 "#d699b6"
  :base0A "#83c092"
  :base0B "#dbbc7f"
  :base0C "#e69875"
  :base0D "#a7c080"
  :base0E "#e67e80"
  :base0F "#d699b6")

(load-theme "everfores-dark")
