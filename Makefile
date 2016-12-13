default: report.pdf

template = template.latex

report.html report.pdf: report.md bibliography.yaml $(template)
	pandoc --filter pandoc-citeproc \
		--csl harvard-greenwich.csl \
		--bibliography=bibliography.yaml \
		--latex-engine=xelatex \
		--template=$(template) \
		-V geometry:a4paper \
		-V mainfont=Constantia \
		--number-sections \
		--toc \
		-s -o $@ $<

clean:
	rm -f report.{html,pdf}
