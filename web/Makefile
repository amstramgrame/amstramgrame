
MAKE 	?= make
AWK		?= awk

MKDIR    := mkdocs
DOCDIR   := $(MKDIR)/docs
FAUSTDIR ?= ../../faust
EXDIR    ?= ../examples

SRC   	 := $(shell [ -d src ] && find src -name "*.md" -print || printf "")
MD   	 := $(SRC:src/%=$(DOCDIR)/%)
DSP   	 := $(shell [ -d "$(DOCDIR)" ] && find "$(DOCDIR)" -name "*.dsp" ! -name "mix4.dsp" -print || printf "")
SVGDIRS  := $(shell [ -d "$(DOCDIR)" ] && find $(DOCDIR) -type d -name "exfaust*" -print || printf "")
SVG   	 := $(DSP:%.dsp=%.svg)

EXSRC    := $(shell [ -d "$(EXDIR)" ] && ls -1d $(EXDIR)/*/ 2>/dev/null | sed 's:/*$$::' | sort -f | grep -v old || printf "")
EXLIST   := $(EXSRC:$(EXDIR)/%=%)
EXOUT    := $(GEN:%=%.md)


GENERATED := $(shell [ -d "$(DOCDIR)" ] && find $(DOCDIR) -type d -name "exfaust*" -print || printf "")
#TOOLS    := $(wildcard $(FAUSTDIR)/tools/faust2appls/faust2*)
IGNORED := "atomsnippets|dummy|faust2eps|firefox|graph|jackinternal|javaswing|mathviewer|faust2md|octave|owl|faust2pdf|faust2png|faust2pure|faust2ros|faust2sig|supercollider|faust2svg|faust2teensy|faust2vst|faust2w32|faust2w64|faust2winunity"
TOOLS    := $(shell find $(FAUSTDIR)/tools/faust2appls -name "faust2*" | egrep -v $(IGNORED) | sort)

EDITOR      := https://faustide.grame.fr/

.PHONY: tagslist.txt


####################################################################
help:
	@echo "======================================================="
	@echo "                   Faust Documentation"
	@echo "This Makefile is intended to generate the faust documentation"
	@echo "======================================================="
	@echo "Available targets are:"
	@echo "  install  : install the required components"
	@echo "  build    : build the web site"
	@echo "  serve    : launch the mkdoc server"
	@echo "Development specific targets are available:"
	@echo "  all      : generates all the necessary files from the src folder"
	@echo "             actually call the 'md', 'options', 'tools', and 'svg' targets"
	@echo "  md       : build the md files"
	@echo "  svg      : build the svg files"
	@echo "             the 'svg' target should be the last target called"
	@echo "  options  : build the compiler options page"
	@echo "  tools    : build the faust tools page"
	@echo "Making the current version publicly available:"
	@echo "             just commit and push the /docs folder (master branch)"

test: 
	@echo TOOLS: $(TOOLS)

####################################################################
ifeq ($(strip $(SITE_DIR_EN)),)
ifneq ($(strip $(SITE_DIR)),)
SITE_DIR_EN := $(SITE_DIR)/en
endif
endif

build:
	$(MAKE) all
	cd $(MKDIR) && if [ -n "$(SITE_DIR)" ]; then mkdocs build --site-dir "$(SITE_DIR)"; else mkdocs build; fi
	if [ -n "$(SITE_DIR_EN)" ]; then cd en && SITE_DIR="$(SITE_DIR_EN)" $(MAKE) build; else cd en && $(MAKE) build; fi
	if [ -z "$(SITE_DIR)" ]; then git checkout ../docs/CNAME; fi
	
serve:
	@echo "you can browse the site at http://localhost:8000"
	cd $(MKDIR) && mkdocs serve

all:
	$(MAKE) md
#	$(MAKE) svg

clean:
	rm -f $(MD)
	rm -rf $(GENERATED)
	rm -f $(EXOUT)
	rm -rf $(SVGDIRS)	

####################################################################
# building md and svg files
md : $(MD)

$(DOCDIR)/%.md:src/%.md 
	@echo ========= building $<
	@[ -d $(DOCDIR)/$* ] | mkdir -p $(DOCDIR)/$*
	cat $< | $(AWK) -f scripts/faustcode.awk IMG=$* DOCROOT=$(DOCDIR) > $@

svg : $(SVG)
%.svg:%.dsp
	faust -svg $< > /dev/null
	mv $(@D)/exfaust*-svg/process.svg $@
	rm -rf $(@D)/exfaust*-svg

####################################################################
install:
	pip install mkdocs
#	pip install mkdocs-pdf-export-plugin
	pip install markdown-include
	pip install mkdocs-bootswatch
	pip install python-markdown-math
#	npm i railroad-diagrams

uninstall:
	pip uninstall -y mkdocs-material
	pip uninstall -y pymdown-extensions
	pip uninstall -y markdown-blockdiag
#	pip uninstall -y mkdocs-pdf-export-plugin
