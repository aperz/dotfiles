#!/bin/bash

# $1 is a dir with files to merge
# $2 is an extension ('tsv')
# New table is saved to the cwd as 'merged.extension'

echo $1
echo $2

#cat sed 1d '$1'/*.'$2' > merged_`date +%d%m%Y%H%M`.'$2'

# assumes no empty files:
#head -2 $(ls $1/*.$2 | head -n 1) > merged.$2

head -2 $(find $1 -not -empty -name "*.$2" -not -name "*merged*" | head -n 1) > merged.$2

tail -n +2 -q $1/*.$2 >> merged.$2

