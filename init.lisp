(defpackage #:lem-my-init
  (:use #:cl #:lem))

(in-package :lem-my-init)

(asdf:clear-source-registry)

(let ((asdf:*central-registry*
        (append (list (asdf:system-source-directory :lem)
                      #P"~/.lem/"
                      #P"~/quicklisp/local-projects/"
                      #P"~/common-lisp/")
                asdf:*central-registry*)))
  (ql:quickload :lem-my-init :silent t))
