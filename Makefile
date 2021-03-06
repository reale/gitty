.PHONY: all install doc tests lint

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: ;

install:
	scripts/gitty-install -D

doc: README.inc.md mk-doc lib/*
	cp -p README.inc.md README.md
	./mk-doc >> README.md

tests:
	bats $$(find test -maxdepth 1 -type f -name '*.bats')

lint:
	shellcheck $$(grep -rl '^#![[:blank:]]*/bin/bash')
