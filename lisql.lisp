(defpackage :lisql
  (:use :cl)
  (:export :select
           :insert
           :update))
(in-package :lisql)

(defun stringify-with-comma (list)
  (format nil "~{~A~^, ~}" list))

(defun stringify (list)
  (format nil "~{~A~^ ~}"
          (loop :for elt :in list
                :collect (etypecase elt
                           (string (format nil "'~A'" elt))
                           (symbol elt)
                           (list (format nil "(~A)" (stringify-with-comma elt)))))))

(defmacro select (&body args)
  `(stringify '(select ,@args)))

(defmacro insert (&body args)
  `(stringify '(insert ,@args)))

(defmacro update (&body args)
  `(stringify '(update ,@args)))
