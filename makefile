SHELL=/usr/bin/sh

PHONY: build

build:
	pandoc -L statement/statement.lua -s kategorie.md -o kategorie.pdf

install:
	git clone https://github.com/dialoa/statement

