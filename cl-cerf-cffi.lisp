(in-package :cl-cerf-cffi)

(define-foreign-library cerf
  (:unix "libcerf.so")
  (t (:default "libcerf")))

(use-foreign-library cerf)

(defcstruct c-complex
  (:real :double)
  (:imag :double))

;;; Faddeeva's scaled c-complex error function:
(defcfun "w_of_z" (:struct c-complex)
  (z (:struct c-complex)))
(defcfun "im_w_of_x" :double
  (x :double))
(defcfun "re_w_of_z" :double
  (z (:struct c-complex)))
(defcfun "im_w_of_z" :double
  (z (:struct c-complex)))

;;; error function of c-complex arguments
(defcfun "cerf" (:struct c-complex)
  (z (:struct c-complex)))
;; complement
(defcfun "cerfc" (:struct c-complex)
  (z (:struct c-complex)))
;; underflow-compensated
(defcfun "cerfcx" (:struct c-complex)
  (z (:struct c-complex)))
;; underflow-compensated real case
(defcfun "erfcx" :double
  (x :double))
;; imaginary error function erfi(z) = -i erf(i z)
(defcfun "cerfi" (:struct c-complex)
  (z (:struct c-complex)))
;; real case
(defcfun "erfi" :double
  (x :double))

;;; Dawson's integral
(defcfun "cdawson" (:struct c-complex)
  (z (:struct c-complex)))
;; real version
(defcfun "dawson" :double
  (x :double))

;;; Voigt
(defcfun "voigt" :double
  (x :double)
  (sigma :double)
  (gamma :double))
;; HWHM
(defcfun "voigt_hwhm" :double
  (sigma :double)
  (gamma :double))

;;; Experimental
(defcfun "cerf_experimental_imw" :double
  (x :double)
  (y :double))
(defcfun "cerf_experimental_rew" :double
  (x :double)
  (y :double))
