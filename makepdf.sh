mkdir -p enpdf
# make index
pdflatex -file-line-error -output-directory enpdf "\input{clm}"

makeindex -o enpdf/symbols.ind enpdf/symbols.idx
makeindex -o enpdf/issues.ind enpdf/issues.idx

# make pdf
pdflatex -file-line-error -output-directory enpdf "\input{clm}"

mv enpdf/clm.pdf enpdf/cltl2.pdf
