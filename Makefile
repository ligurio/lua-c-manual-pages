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

INDEX := index.html

all: check

man3/%.3.html: style.css

.3.3.html:
	mandoc -Thtml -Ostyle=style.css $< > $@

index:
	@printf '%s\n' \
		'<!DOCTYPE html>' \
		'<html lang="en">' \
		'  <head>' \
		'    <meta charset="utf-8">' \
		'    <title>Lua 5.1 C API</title>' \
		'    <link rel="stylesheet" href="style.css" type="text/css" media="all"/>' \
		'  </head>' \
		'  <body>' \
		'    <h2>Lua 5.1 C API</h2>' > ${INDEX}
	@printf '\t\t<ul>\n' >> ${INDEX}
	@for m in ${MANPAGE_FILES}; do \
		n=$$(basename $$m .3); \
		printf '\t\t<li><a href="%s.3.html">%s</a></li>\n' "$$n" "$$n"; \
	done >> ${INDEX}
	@printf '\t\t</ul>\n' >> ${INDEX}
	@printf '%s\n' \
		'  </body>' \
		'</html>' >> ${INDEX}

html: ${HTML_FILES} index

check: ${MANPAGE_FILES}
	@for m in ${MANPAGE_FILES}; do \
		mandoc -Tlint $$m -W style; \
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

.PHONY: all check install uninstall html index clean
