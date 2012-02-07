#~/bin/sh
mkdir -p html/
pdflatex -file-line-error -interaction nonstopmode -output-directory output clm | wc -l
tex '\def\filename{{clm}{idx}{4dx}{ind}} \input idxmake.4ht'
makeindex -o clm.ind clm.4dx
htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '-d./html/' '-interaction=batchmode'
