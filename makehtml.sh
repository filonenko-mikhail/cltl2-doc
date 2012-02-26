#!/bin/sh
if [ -f symbols.idx ]; then
    tex '\def\filename{{symbols}{idx}{4dx}{ind}} \input  idxmake.4ht' 
makeindex -o symbols.ind symbols.4dx 
fi

if [ -f issues.idx ]; then
    tex '\def\filename{{issues}{idx}{4dx}{ind}} \input  idxmake.4ht' 
makeindex -o issues.ind issues.4dx 
fi

htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '' '-interaction=batchmode'
cp -f clm.html index.html
