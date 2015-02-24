#!/bin/bash

STATAFILES=`ls -1 *.do`
RFILES=`ls -1 *.r`

OUTDIR="../"

for file in $STATAFILES ; do
    echo "$file"
    outfile=`basename $file .do`
    echo "---"          > ${OUTDIR}${outfile}.md
    echo "layout: dtc" >> ${OUTDIR}${outfile}.md
    echo "---"         >> ${OUTDIR}${outfile}.md
    echo "\`\`\`stata" >> ${OUTDIR}${outfile}.md
    cat $file          >>  ${OUTDIR}${outfile}.md
    echo "\`\`\`"      >> ${OUTDIR}${outfile}.md
done

for file in $RFILES ; do
    echo "$file"
    outfile=`basename $file .r`
    echo "---"          > ${OUTDIR}${outfile}.md
    echo "layout: dtc" >> ${OUTDIR}${outfile}.md
    echo "---"         >> ${OUTDIR}${outfile}.md
    echo "\`\`\`R"     >> ${OUTDIR}${outfile}.md
    cat $file          >>  ${OUTDIR}${outfile}.md
    echo "\`\`\`"      >> ${OUTDIR}${outfile}.md
done

