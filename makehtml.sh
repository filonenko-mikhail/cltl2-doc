#!/bin/sh
tex '\def\filename{{clm}{idx}{4dx}{ind}} \input idxmake.4ht'
makeindex -o clm.ind clm.4dx
htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '' '-interaction=batchmode'
cp -f clm.html index.html


# \cd{( 1 2 3)}

#\cd{test-function}

# \cd{read}