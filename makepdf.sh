#!/bin/sh
mkdir -p output/
pdflatex -file-line-error -interaction nonstopmode -output-directory output clm | wc -l
makeindex -o output/clm.ind output/clm.idx
pdflatex -file-line-error -interaction nonstopmode -output-directory output clm | wc -l