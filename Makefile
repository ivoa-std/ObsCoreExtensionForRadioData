# ivoatex Makefile.  The ivoatex/README for the targets available.

# short name of your document (edit $DOCNAME.tex; would be like RegTAP)
DOCNAME = ObsCoreExtensionForRadioData

# count up; you probably do not want to bother with versions <1.0
DOCVERSION = 1.0

# Publication date, ISO format; update manually for "releases"
DOCDATE = 2024-04-08

# What is it you're writing: NOTE, WD, PR, or REC
DOCTYPE =  WD

AUTHOR_EMAIL=francois.bonnarel@astro.unistra.fr

IVOA_GROUP = Data Model

# Source files for the TeX document (but the main file must always
# be called $(DOCNAME).tex
SOURCES = $(DOCNAME).tex role_diagram.pdf Appendix.tex

# List of pixel image files to be included in submitted package
FIGURES = role_diagram.svg

# List of PDF figures (for vector graphics)
VECTORFIGURES = role_diagram.pdf

# Additional files to distribute (e.g., CSS, schema files, examples...)
AUX_FILES =

include ivoatex/Makefile
ivoatex/Makefile:
	@echo "*** ivoatex submodule not found.  Initialising submodules."
	@echo
	git submodule update --init

# update the registry record example from a locally running DaCHS
sample-record.xml:
	curl -s http://localhost:8080/getRR/__system__/obs-radio/obs_radio | xmlstarlet fo > $@

STILTS ?= stilts

test:
	@$(STILTS) xsdvalidate sample-record.xml
