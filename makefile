SHELL=/usr/bin/sh
MAKEFLAGS += --silent

PHONY: build

build:
	pandoc -L statement/statement.lua -s kategorie.md -o kategorie.pdf #--verbose
	echo "Done"

install:
	git clone https://github.com/dialoa/statement

