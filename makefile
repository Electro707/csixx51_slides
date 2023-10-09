TEX_COMPILER := pdflatex

SRCS = $(wildcard *-Lecture*.tex)
PROGS = $(patsubst %.tex,%.pdf,$(SRCS))

.PHONY: all
all: $(PROGS)

clean:
	rm -r build

%.pdf: %.tex
	mkdir -p build
	mkdir -p pdf_out
	$(TEX_COMPILER) -output-directory=build -shell-escape $<
	# do it twice, as bookmarks and whatnot need a second re-run
	$(TEX_COMPILER) -output-directory=build -shell-escape $<
	mv build/$@ pdf_out/
