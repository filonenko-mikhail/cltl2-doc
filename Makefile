.PHONY=all clean

all: cltl2.pdf

clean:
	rm -f cltl2.pdf
	rm -rf output
	rm -f *.aux
	rm -f *.4ct
	rm -f *.4tc
	rm -f clm*.html
	rm -f clm*.css
	rm -f *.dvi
	rm -f *.idv
	rm -f *.idx
	rm -f *.log
	rm -f *.lg
	rm -f *.tmp
	rm -f *.xref
	rm -f clm.pdf
	rm -f clm*.png
	rm -rf html

cltl2.pdf : output/clm.pdf

PDFLATEX=pdflatex -file-line-error -interaction nonstopmode -output-directory output clm | wc -l
PDFLATEX2=pdflatex -file-line-error -interaction nonstopmode clm | wc -l


output/clm.pdf : output/clm.ind
	mkdir -p output
	$(PDFLATEX)

%.ind : %.idx
	makeindex -o $@ $<

output/clm.idx : *.tex
	mkdir -p output
	$(PDFLATEX)

html: clm.html

clm.html : html/clm.html

HTMLLATEX=htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '-d./html/' '-interaction=batchmode'


html/clm.html : clm.ind
	mkdir -p html 
	$(HTMLLATEX) 

%.ind : %.4dx
	makeindex -o $@ $<

clm.4dx : %.idx
	tex '\def\filename{{clm}{idx}{4dx}{ind}} \input idxmake.4ht'

clm.idx : *.tex
	$(PDFLATEX2)






 #rm -f *.aux
 #rm -f *.4ct
 #rm -f *.4tc
 #rm -f clm*.html
 #rm -f clm*.css
 #rm -f *.dvi
 #rm -f *.idv
 #rm -f *.idx #rm -f *.log
 #rm -f *.lg
 #rm -f *.tmp
 #rm -f *.xref
 #rm -f clm.pdf
 #rm -f clm*.png

# tex '\def\filename{{clm}{idx}{4dx}{ind}} \input idxmake.4ht'
# makeindex -o clm.ind clm.4dx
# instead of