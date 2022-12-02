OUTDIR ?= _site
MARKDOWNS := $(wildcard **/*.md)
PDFS := $(patsubst %.md,$(OUTDIR)/%.pdf,$(MARKDOWNS))
MDFLAGS := -f markdown -t beamer -s -H include.tex -V aspectratio:169 -V urlcolor:red

all: $(PDFS)

$(OUTDIR)/%.pdf: %.md
	mkdir -p $(dir $@) && pandoc $(MDFLAGS) --output $@ $^

.PHONY: clean
clean:
	rm -f $(PDFS)
