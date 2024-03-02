(defpackage :lisql
  (:use :cl)
  (:export :now
           :select
           :insert
           :update))
(in-package :lisql)

(defun stringify-list (list)
  (loop :for elt :in list
        :collect (etypecase elt
                   (integer (princ-to-string elt))
                   (string (format nil "'~A'" elt))
                   (symbol elt)
                   (list
                    (if (equal elt '(now))
                        "now()"
                        (format nil "(~A)" (stringify-with-comma elt)))))))

(defun stringify-with-comma (list)
  (format nil "~{~A~^, ~}"
          (stringify-list list)))

(defun stringify (list)
  (format nil "~{~A~^ ~}"
          (stringify-list list)))

(defmacro select (&body args)
  `(stringify '(select ,@args)))

(defmacro insert (&body args)
  `(stringify '(insert ,@args)))

(defmacro update (&body args)
  `(stringify '(update ,@args)))
