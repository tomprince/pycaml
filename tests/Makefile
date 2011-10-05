
SITELIBDIR ?= $(shell readlink -f ../..)/site-lib

all: test

test:
	env OCAMLFIND_CONF=${SITELIBDIR}/findlib.conf ocaml sizetest.ml

clean:
	rm -f sizetestresults.txt

.PHONY: all test clean
