#ifndef PYCAML_H
#define PYCAML_H

#include "Python.h"
#include "caml/mlvalues.h"

PyObject *pyunwrap( value v );
value pywrap_steal( PyObject *obj );

#endif
