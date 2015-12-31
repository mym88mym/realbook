#!/bin/bash

while read line; do
    if [ "$line" != "" ]; then
	if [[ $line != *"#"* ]]; then
	    if [[ $line != *"exercises"* ]]; then
		set -- $line;
		printf '\n***\n';
		echo '*** make tex' $1 $2;
	        printf '***\n\n';
		pandoc --from markdown --to latex out/$2.md -o out/$2.tex;
	    fi
	fi
    fi
done < filenames.txt 

grep -v frontmatter out/introduction.tex | grep -v mainmatter > out/introduction_clean.tex
rm out/introduction.tex
mv out/introduction_clean.tex out/introduction.tex

cd out
sed -i 's/includegraphics/includegraphics[width=0.5\\textwidth]/' *.tex
cd ..
