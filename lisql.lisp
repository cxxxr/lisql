(defpackage :lisql
  (:use :cl)
  (:shadow :delete)
  (:export :now
           :select
           :insert
           :update
           :delete))
(in-package :lisql)

(defun stringify-list (list)
  (loop :for elt :in list
        :collect (etypecase elt
                   (integer (princ-to-string elt))
                   (string (format nil "'~A'" elt))
                   ;; (keyword (format nil "\"~A\"" (string-downcase elt)))
                   (symbol elt)
                   (list
                    (cond ((equal elt '(now))
                           "now()")
                          ((eq (first elt) 'cl:quote)
                           (format nil "\"~A\"" (string-downcase (second elt))))
                          (t
                           (format nil "(~A)" (stringify-with-comma elt))))))))

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

(defmacro delete (&body args)
  `(stringify '(delete ,@args)))
