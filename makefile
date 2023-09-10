TEX_COMPILER := pdflatex

SRCS = $(wildcard *-Lecture*.tex)
PROGS = $(patsubst %.tex,%.pdf,$(SRCS))

.PHONY: all
all: $(PROGS)

clean:
	rm -f *.pdf *.toc *.aux *.log *.snm *.out *.nav
	ls | grep '_minted*' | xargs rm -rf

%.pdf: %.tex
	$(TEX_COMPILER) -shell-escape $<
	# do it twice, as bookmarks and whatnot need a second re-run
	$(TEX_COMPILER) -shell-escape $<
