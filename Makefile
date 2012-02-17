.PHONY=all clean

all: cltl2.pdf

clean:
	rm -f cltl2.pdf
	rm -rf output

cltl2.pdf : output/clm.pdf
	if test -f $@; then touch $@; else ln -s $< $@; fi

PDFLATEX=pdflatex -file-line-error -interaction nonstopmode -output-directory output clm | wc -l

output/clm.pdf : output/clm.ind
	$(PDFLATEX)

%.ind : %.idx
	makeindex -o $@ $<

output/clm.idx : *.tex
	mkdir -p output
	$(PDFLATEX)
