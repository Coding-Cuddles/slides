OUTDIR ?= _site
MARKDOWNS := $(wildcard **/*.md)
PDFS := $(patsubst %.md,$(OUTDIR)/%.pdf,$(MARKDOWNS))

all: $(PDFS)

$(OUTDIR)/%.pdf: %.md
	mkdir -p $(dir $@) && pandoc --from markdown --to beamer --standalone --output $@ $^

.PHONY: clean
clean:
	rm -f $(PDFS)
