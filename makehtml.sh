#!/bin/sh
mkdir -p html/
# latex -file-line-error -interaction nonstopmode clm | wc -l
# sleep 10
# tex '\def\filename{{clm}{idx}{4dx}{ind}} \input idxmake.4ht'
# makeindex -o clm.ind clm.4dx
htlatex clm.tex 'cltl,3,next,charset=utf-8' ' -cunihtf -utf8' '-d./html/' '-interaction=batchmode'
