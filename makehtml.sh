#~/bin/sh
mkdir -p html/
htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '' '-interaction=batchmode'
tex '\def\filename{{clm}{idx}{4dx}{ind}} \input idxmake.4ht'
makeindex -o clm.ind clm.4dx
htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '-d./html/' '-interaction=batchmode'
