## hack to avoid the disturbing rules built into gmake
## (in particular setting CC, wrong implicit rules, etc)

ifeq (${RECURSIVECALL},)
MAKEFLAGS += -rR
.PHONY:.FORCE
%:.FORCE
	@${MAKE} RECURSIVECALL=1 $@
all:
	@${MAKE} RECURSIVECALL=1 all
# empty rule to avoid forwarding Makefile to the else path
Makefile:
	@true
else

############## Actual Makefile starts here ######################################

# If config.mk exists, include it

CONFIGMK = $(shell if [ -f config.mk ]; then echo config.mk; else echo /; fi)
ifneq (${CONFIGMK},/)
include ${CONFIGMK}
endif

ifeq (${WITH_DOC},YES)
DOCDIRPARENT ?= $(shell readlink -f ..)/doc
DOCDIR ?= ${DOCDIRPARENT}/pycaml
DOCS=work/.done_doc
OCAMLDOC ?= ocamldoc

work:
	mkdir -p work

work/.done_doc: pycaml.mli | work
	mkdir -p work/doc
	${OCAMLDOC} pycaml.mli -html -d work/doc
	touch work/.done_doc

INSTALLDOCS_CMD ?=${MAKE} installdocs

installdocs:
	mkdir -p ${DOCDIR}
	(cd work/doc && find . -type f | cpio -dump ${DOCDIR})

uninstalldocs:
	rm -rf ${DOCDIR}
	if [ -d ${DOCDIRPARENT} ] && [ `find ${DOCDIRPARENT} | wc -l` -le 1 ]; then rm -rf ${DOCDIRPARENT}/.. || true; fi

.PHONY: installdocs

else
INSTALLDOCS_CMD=true

uninstalldocs:
	true

endif # WITH_DOC

# not set by configure

EXTRACFLAGS ?= -g
OCAMLFIND ?= ocamlfind
OCAMLMKLIB ?= ocamlmklib
CFLAGS    ?= -fPIC ${INCLUDEPATH} ${EXTRACFLAGS}
CC ?= cc
INSTALL ?= install -m 444

OCAMLGLOBALLDCONF ?= $(shell $(OCAMLFIND) printconf ldconf)
OCAMLGLOBALFINDLIB ?= $(shell $(OCAMLFIND) printconf conf)

SITELIBDIR ?= $(shell readlink -f ..)/site-lib
BUILDNAME ?= pycaml
HEADERDIR ?= ${SITELIBDIR}/${BUILDNAME}/include

HEADER=pycaml.h
OBJECTS=pycaml_stubs.o 
CMO=pycaml.cmo
MI=pycaml.mli

INSTALLTARGETS= META pycaml.cma pycaml.cmo pycaml.cmxa pycaml.cmi

all: ${INSTALLTARGETS} ${DOCS}

%.cma: ${OBJECTS} ${CMO} ${MI}
	${OCAMLMKLIB} ${LINKFLAGS} -o $* ${MI} ${CMO} ${OBJECTS}

%.cmxa: ${OBJECTS} ${CMO} ${MI}
	${OCAMLMKLIB} ${LINKFLAGS} -o $* ${MI} ${CMO} ${OBJECTS}

%.o: %.c
	${OCAMLFIND} ocamlc -c -cc "${CC}" -ccopt "${CFLAGS}" -o $@ $<

%.cmi: %.mli
	${OCAMLFIND} ocamlc -c $<

%.cmo: %.ml %.cmi
	${OCAMLFIND} ocamlc -c  $<

clean:
	rm -f *.o *~ *.cmi *.cmo *.a *.so *core *.cma *.cmxa
	rm -rf work

install: ${INSTALLTARGETS} fixfindlib  ${DOCS}
	${INSTALLDOCS_CMD}
	mkdir -p ${SITELIBDIR}
	if [ -d ${SITELIBDIR}/${BUILDNAME} ] ; then  ${MAKE} uninstall ; else true ; fi
	mkdir -p ${SITELIBDIR}
	[ -f ${SITELIBDIR}/ld.conf ] || cp ${OCAMLGLOBALLDCONF} ${SITELIBDIR}
	[ -f ${SITELIBDIR}/findlib.conf ] || (cp ${OCAMLGLOBALFINDLIB} ${SITELIBDIR}/findlib.conf && chmod 644 ${SITELIBDIR}/findlib.conf && /bin/sh fixfindlib ${SITELIBDIR})
	${OCAMLFIND} install -ldconf ${SITELIBDIR}/ld.conf -destdir ${SITELIBDIR} ${BUILDNAME} ${INSTALLTARGETS} *.so *.a
	mkdir -p ${HEADERDIR}
	${INSTALL} ${HEADER} ${HEADERDIR}
	@echo
	@echo Do not forget to set OCAMLFIND_CONF to ${SITELIBDIR}/findlib.conf
	@echo E.g., on a bash you can say
	@echo OCAMLFIND_CONF=${SITELIBDIR}/findlib.conf ocaml
	@echo

uninstall:
	if [ -d ${HEADERDIR} ]; then rm -rf ${HEADERDIR}; else true; fi
	${OCAMLFIND} remove -ldconf ${SITELIBDIR}/ld.conf -destdir ${SITELIBDIR} ${BUILDNAME}
	if [ `find ${SITELIBDIR} -type d | wc -l` -le 1 ]; then rm -rf ${SITELIBDIR} || true; fi

mrproper: clean uninstall uninstalldocs
	rm -f config.mk

.PHONY: clean mproper all install uninstall uninstalldocs
.PRECIOUS: %.cmo %.cmi %.mli

endif
