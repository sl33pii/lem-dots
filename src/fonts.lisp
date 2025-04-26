(defpackage :config/fonts
  (:use :cl :lem))

(in-package :config/fonts)

#+lem-sdl2
(ignore-errors
  (let ((font-regular #p"~/Library/Fonts/FiraCodeNerdFontMono-Medium.ttf")
        (font-bold #P"~/Library/Fonts/FiraCodeNerdFontMono-Bold.ttf"))
    (if (and (uiop:file-exists-p font-regular)
             (uiop:file-exists-p font-bold))
        (lem-sdl2/display-change-font (lem-sdl2/display:current-display)
                                      (lem-sdl2/font:make-font-config
                                       :latin-normal-file font-regular
                                       :latin-bold-file font-bold
                                       :cjk-normal-file font-regular
                                       :cjk-bold-file font-bold))
        (message "Fonts not found."))))

;; Tidy up unused stuff
(remove-hook *after-init-hook*
             'lem/frame-multiplexer::enable-frame-multiplexer)

;; Big font
#+lem-sdl2
(lem-if:set-font-size (implementation) 34)

