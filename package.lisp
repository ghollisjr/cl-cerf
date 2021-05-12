(defpackage #:cl-cerf-cffi
  (:use :cl
        :cffi)
  (:export
   ;; Faddeeva's scaled complex error function
   :w-of-z
   :im-w-of-x
   :re-w-of-z
   :im-w-of-z
   ;; error function of complex arguments
   :cerf
   :cerfc
   :cerfcx
   :erfcx
   :cerfi
   :erfi
   ;; Dawson's integral
   :cdawson
   :dawson
   ;; Voigt's profile
   :voigt
   :voigt-hwhm
   ;; Experimental
   :cerf-experimental-imw
   :cerf-experimental-rew))

(defpackage #:cl-cerf
  (:use :cl
        :cffi)
  (:export
   ;; Faddeeva's scaled complex error function
   :faddeeva-w
   ;; error function of complex arguments
   :erf
   :erfc
   :erfcx
   :erfi
   ;; Dawson's integral
   :dawson
   ;; Voigt's profile
   :voigt
   :voigt-hwhm
   ))
