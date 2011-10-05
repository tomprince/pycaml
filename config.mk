## configure run on Wed Oct 5 08:54:43 BST 2011
PYTHONINC ?= -I/usr/include/python2.6
PYTHONLIB ?= -lpython2.6 -L/usr/lib

INCLUDEPATH ?= ${PYTHONINC}
LINKFLAGS   ?= ${EXTRALIB} ${PYTHONLIB}

