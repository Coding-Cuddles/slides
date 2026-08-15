OUTDIR ?= _site

# Decks live in per-curriculum subdirectories; -mindepth 2 keeps README.md out.
MARKDOWNS := $(shell find . -mindepth 2 -name '*.md' \
	-not -path './node_modules/*' -not -path './$(OUTDIR)/*' | sed 's|^\./||' | sort)
PDFS := $(patsubst %.md,$(OUTDIR)/%.pdf,$(MARKDOWNS))
MDFLAGS := -f markdown -t beamer -s -H include.tex -V aspectratio:169 -V urlcolor:red
HTMLFLAGS := -f markdown -t html5 -s --template index.template.html --lua-filter index.lua

.PHONY: all check clean format format-check lint

all: $(PDFS) $(OUTDIR)/index.html

check: format-check lint

format:
	npm run format

format-check:
	npm run format-check

lint:
	npm run lint

$(OUTDIR)/%.pdf: %.md
	mkdir -p $(dir $@) && pandoc $(MDFLAGS) --output $@ $^

$(OUTDIR)/index.html: README.md index.template.html index.lua
	mkdir -p $(dir $@) && pandoc $(HTMLFLAGS) --output $@ $<

clean:
	rm -f $(PDFS) $(OUTDIR)/index.html
