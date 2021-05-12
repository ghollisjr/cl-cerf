(defsystem cl-cerf
  :serial t
  :description "Lisp wrapper to libcerf"
  :license "Public Domain"
  :author "Gary Hollis"
  :depends-on (:cffi :cffi-libffi)
  :components
  ((:file "package")
   (:file "cl-cerf-cffi")
   (:file "cl-cerf")))
