# This way everything works as expected ever for
# `make -C /path/to/project` or
# `make -f /path/to/project/Makefile`.
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_DIR := $(patsubst %/,%,$(dir $(MAKEFILE_PATH)))

PREFIX ?= /usr
PREFIX_MAN = ${PREFIX}/share/man

.SUFFIXES: .3 .3.html

MANPAGE_FILES := $(wildcard man3/*.3)
HTML_FILES := $(patsubst %.3,%.3.html,$(MANPAGE_FILES))

all: check

man3/%.3.html: style.css

.3.3.html:
	mandoc -Thtml -Ostyle=style.css $< > $@

html: ${HTML_FILES}

check: ${MANPAGE_FILES}
	@for m in ${MANPAGE_FILES}; do \
		mandoc -Tlint $$m -W error,style,unsupp,warning,stop; \
	done

install: ${MANPAGE_FILES}
	@mkdir -p ${PREFIX_MAN}/man3
	@for m in ${MANPAGE_FILES}; do \
		install $$m ${PREFIX_MAN}/man3/$$(basename $$m); \
	done

uninstall: ${MANPAGE_FILES}
	@for m in ${MANPAGE_FILES}; do \
		rm ${PREFIX_MAN}/man3/$$(basename $$m); \
	done

clean:
	rm -f ${HTML_FILES}

.PHONY: all check install uninstall html clean
