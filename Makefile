# Racket version
RACKET_VERSION=8.11.1

.PHONY: deps test clean

deps: 
	# brew install --cask racket@$(RACKET_VERSION)
	brew install --cask racket

install:
	raco pkg install malt

update:
	raco pkg update malt
	git pull

setup:
	bash ./setup.sh

test:
	raco test malt/tests

repl:
	racket -i

clean:
	raco pkg remove malt
	rm -rf .racket

docs:
	raco docs malt

serve-docs: docs
	rackoon serve-doc
