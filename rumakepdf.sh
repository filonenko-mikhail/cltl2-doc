mkdir -p rupdf

# make index
pdflatex -file-line-error -output-directory rupdf "\def\rulang{}\input{clm}"
makeindex -o rupdf/symbols.ind rupdf/symbols.idx
makeindex -o rupdf/issues.ind rupdf/issues.idx

# make pdf
pdflatex -file-line-error -output-directory rupdf "\def\rulang{}\input{clm}"
mv rupdf/clm.pdf rupdf/cltl2.pdf