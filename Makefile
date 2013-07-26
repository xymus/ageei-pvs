.md.html:
	pandoc -s --template=templates/default.html -t html $< > $@

.md.tex:
	pandoc -s --template=templates/default.tex -t latex $< > $@

.tex.pdf:
	# compile into /tmp for cleanlyness (we don't want dirt behind the fridge!)
	rubber --pdf --into /tmp $<

	# bring back the pdf
	cp /tmp/`basename $@` $@

.SUFFIXES: .tex .md .pdf .html
