.PHONY=all clean

all: cltl2.pdf

clean:
	rm -f cltl2.pdf
	rm -rf output
	rm -f index.html
	rm -f *.aux
	rm -f *.4ct
	rm -f *.4tc
	rm -f *.html
	rm -f *.css
	rm -f *.dvi
	rm -f *.idv
	rm -f *.idx
	rm -f *.log
	rm -f *.lg
	rm -f *.tmp
	rm -f *.xref
	rm -f *.png
	rm -rf html

cltl2.pdf : output/clm.pdf

PDFLATEX=pdflatex -file-line-error -interaction nonstopmode -output-directory output clm | wc -l
PDFLATEX2=pdflatex -file-line-error -output-directory output clm


output/clm.pdf : output/clm.ind
	$(PDFLATEX)

%.ind : %.idx
	makeindex -o $@ $<

output/clm.idx : *.tex
	mkdir -p output
	$(PDFLATEX)


html: clm.html

clm.html : html/clm.html

HTMLLATEX=htlatex clm.tex 'cltl,4,next,charset=utf-8' ' -cunihtf -utf8' '-d./html/' '-interaction=batchmode'


html/clm.html : *.tex
	mkdir -p html
	$(HTMLLATEX)
	rm -f *.aux
	rm -f *.4ct
	rm -f *.4tc
	rm -f *.html
	rm -f *.css
	rm -f *.dvi
	rm -f *.idv
	rm -f *.idx
	rm -f *.log
	rm -f *.lg
	rm -f *.tmp
	rm -f *.xref
	rm -f *.png
