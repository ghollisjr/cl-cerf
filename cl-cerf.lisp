(in-package :cl-cerf)

;; Utilities
(defun plist->complex (plist)
  (destructuring-bind (&key real imag) plist
    (complex (float real 1d0)
             (float imag 1d0))))

(defun complex->plist (z)
  (list :real (realpart z)
        :imag (imagpart z)))

;; Faddeeva's scaled complex error function
(defgeneric faddeeva-w (z)
  (:documentation "Faddeeva's w(z) scaled complex error function")
  (:method ((z complex))
    (plist->complex (cl-cerf-cffi:w-of-z
                     (complex->plist z))))
  (:method ((x real))
    (plist->complex (cl-cerf-cffi:w-of-z
                     (list :real (float x 0d0)
                           :imag 0d0)))))

;; Error function with complex arguments
(defgeneric erf (z)
  (:documentation "Error function of complex arguments")
  (:method ((z complex))
    (plist->complex (cl-cerf-cffi:cerf
                     (complex->plist z))))
  (:method ((x real))
    (getf (cl-cerf-cffi:cerf
           (list :real (float x 1d0)
                 :imag 0d0))
          :real)))

(defgeneric erfc (z)
  (:documentation "Complementary error function of complex arguments")
  (:method ((z complex))
    (plist->complex (cl-cerf-cffi:cerfc
                     (complex->plist z))))
  (:method ((x real))
    (getf (cl-cerf-cffi:cerfc
           (list :real (float x 1d0)
                 :imag 0d0))
          :real)))

(defgeneric erfcx (z)
  (:documentation "Underflow-compensated error function of complex arguments")
  (:method ((z complex))
    (plist->complex (cl-cerf-cffi:cerfcx
                     (complex->plist z))))
  (:method ((x real))
    (cl-cerf-cffi:erfcx (float x 1d0))))

(defgeneric erfi (z)
  (:documentation "Imaginary error function of complex arguments")
  (:method ((z complex))
    (plist->complex (cl-cerf-cffi:cerfi
                     (complex->plist z))))
  (:method ((x real))
    (cl-cerf-cffi:cerfi
     (list :real (float x 1d0)
           :imag 0d0))))

(defgeneric dawson (z)
  (:documentation "Dawson's integral")
  (:method ((z complex))
    (plist->complex (cl-cerf-cffi:cdawson
                     (complex->plist z))))
  (:method ((x real))
    (cl-cerf-cffi:dawson (float x 1d0))))

;; Voigt's profile
(defun voigt (x sigma gamma)
  (cl-cerf-cffi:voigt (float x 1d0)
                      (float sigma 1d0)
                      (float gamma 1d0)))

(defun voigt-hwhm (sigma gamma)
  (cl-cerf-cffi:voigt-hwhm (float sigma 1d0)
                           (float gamma 1d0)))
