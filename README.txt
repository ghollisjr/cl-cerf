This library is a front-end to the libcerf project
(https://sourceforge.net/projects/libcerf/), which is published under
the MIT license.

This Common Lisp wrapper is public domain.

cl-cerf comes in two layers:

* The CFFI library in the cl-cerf-cffi package
* The Lisp wrapper in the cl-cerf package.

The Lisp wrapper uses generic functions to provide either real or
complex arguments and return values depending on the function.

Note that the w-* functions were renamed to the hopefully more
identifiable name #'faddeeva-w, which encompasses all of the
functionality of that group of functions.

Note that when a complex argument is supplied as input, generally the
result will be a complex number, but for some functions a real input
will lead to only a real output.

Examples:

(cl-cerf:faddeeva-w 1)
==> #C(0.36787944117144233d0 0.6071577058413937d0)

(cl-cerf:faddeeva-w #c(0 1))
==> #C(0.427583576155807d0 0.0d0)

(cl-cerf:erf #c(1 2))
==> #C(-0.5366435657785664d0 -5.0491437034470374d0)

(cl-cerf:erf 1)
==> 0.8427007929497149d0
