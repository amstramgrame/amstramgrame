
MAKE 	?= make
AWK		?= awk

MKDIR    := mkdocs
DOCDIR   := $(MKDIR)/docs
FAUSTDIR ?= ../../faust

UNAME := $(shell uname)

MAXDEPTH := '-d'
ifeq ($(UNAME), Linux)
MAXDEPTH := '-maxdepth'
endif

SRC   	 := $(shell find src -name "*.md")
MD   	 := $(SRC:src/%=$(DOCDIR)/%)
DSP   	 := $(shell find $(DOCDIR) -name "*.dsp" | grep -v mix4.dsp )
SVGDIRS  := $(shell find $(DOCDIR) -type d -name "exfaust*")
SVG   	 := $(DSP:%.dsp=%.svg)

EXSRC    := $(shell find $(EXDIR) $(MAXDEPTH) 1 -type d | sort -f | grep -v old)
EXLIST   := $(EXSRC:$(EXDIR)/%=%)
EXOUT    := $(GEN:%=%.md)


GENERATED := $(shell find $(DOCDIR) -type d -name "exfaust*")
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
build:
	$(MAKE) all
	cd $(MKDIR) && mkdocs build
	git checkout docs/CNAME
	
serve:
	@echo "you can browse the site at http://localhost:8000"
	cd $(MKDIR) && mkdocs serve

all:
	$(MAKE) md
	$(MAKE) svg

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
