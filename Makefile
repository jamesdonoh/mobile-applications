default: report.pdf

report.html report.pdf: report.md bibliography.yaml
	pandoc --filter pandoc-citeproc --csl harvard-greenwich.csl -V geometry:a4paper -V mainfont=Constantia --bibliography=bibliography.yaml --latex-engine=xelatex -s -o $@ $<

clean:
	rm -f report.{html,pdf}
